function each
  while read -l line
    command $argv "$line"
  end
end
