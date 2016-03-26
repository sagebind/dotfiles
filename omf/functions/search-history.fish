function search-history
  history | fzf --query=(commandline) | read line

  if test -n "$line"
    commandline $line
  else
    commandline ''
  end
end
