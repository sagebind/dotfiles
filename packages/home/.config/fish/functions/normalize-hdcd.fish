function normalize-hdcd -a dir
  set -l output_dir (mktemp -d)

  for file in $dir/*.flac
    set -l filename (basename $file)
    ffmpeg -i $file -af hdcd "$output_dir/$filename"
  end

  rsgain easy $output_dir
  mv $output_dir/* $dir/
  rmdir $output_dir
end
