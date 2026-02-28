function download-album-cover -a artist -a album
  # TODO: Accept folder and extract info using metaflac

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

    if test $size -ge 1000
      echo "Found cover art on Genius: $url"
      curl -L -o cover.jpg $url
      break
    end
  end
end
