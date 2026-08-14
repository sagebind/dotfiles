function flac-copy-tags -a src -a dest
  metaflac --no-utf8-convert --export-tags-to=- $src | metaflac --remove-all-tags --import-tags-from=- $dest
end
