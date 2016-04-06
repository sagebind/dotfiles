function to-gif -a input output start length fps scale
  if contains -- -h $argv
    echo "to-gif input output start length fps scale"
    return
  end

  ffmpeg -ss $start -t $length -i "$input" -vf fps=$fps,scale=$scale:-1:flags=lanczos,palettegen palette.png
  ffmpeg -ss $start -t $length -i "$input" -i palette.png -filter_complex "fps=$fps,scale=$scale:-1:flags=lanczos[x];[x][1:v]paletteuse" "$output"
end
