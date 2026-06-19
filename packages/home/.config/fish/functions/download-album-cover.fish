function download-album-cover
  for folder in $argv
    set -l existing_files $folder/cover.*

    if count $existing_files > /dev/null
      echo "Cover art already exists: $existing_files"
      continue
    end

    metaflac --show-tag=ALBUM $folder/01*.flac | read -d= -l tag album
    metaflac --show-tag=ALBUMARTIST --show-tag=ARTIST $folder/01*.flac | head -n1 | read -d= -l tag artist

    echo "Artist: $artist"
    echo "Album: $album"

    # First check Genius
    set -l genius_page https://genius.com/albums/(string replace -a " " "-" $artist)/(string replace -a " " "-" $album)
    set -l genius_urls (
      xidel $genius_page -e '//*[@class="cover_art"]//img/@src' \
      | string match -rg 'https://t2.genius.com/unsafe/[^/]+/(https%3A%2F%2Fimages.genius.com%2F.+)' \
      | string replace -a '%2F' '/' \
      | string replace -a '%3A' ':'
    )

    for url in $genius_urls
      set -l size (string match -rg '(\d+)x1\.jpg$' $url)

      if test -n "$size"; and test $size -ge 1000
        set -f genius_img_url $url
        break
      end
    end

    if test -n "$genius_img_url"
      echo "Found cover art on Genius: $genius_img_url"
      curl -L -o "$folder/cover.jpg" $genius_img_url
      continue
    end

    # Now try Apple Music, since their covers are usually good quality. Once we get
    # a link to the album image, we can select a higher quality version by replacing
    # the dimensions in the URL.
    xidel -s "https://music.apple.com/us/search?term=$artist $album" \
      -f '(//*[@aria-label="Top Results"]//a[contains(@href, "/album/")]/@href)[1]' \
      -e '(//*[@aria-label="Featured"]//picture/source[@type="image/jpeg"]/@srcset)[1]' \
      | string match -rg '(https://\\S+\\.jpg)' \
      | string replace -r '\\d+x\\d+' '1000x1000' \
      | read -l apple_music_img_url

    if test -n "$apple_music_img_url"
      echo "Found cover art on Apple Music: $apple_music_img_url"
      curl -L -o "$folder/cover.jpg" $apple_music_img_url
      continue
    end
  end
end
