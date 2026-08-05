function goose --wraps goose
  if type -fq goose
    command goose $argv
  else
    command "/Applications/Goose.app/Contents/Resources/bin/goose" $argv
  end
end
