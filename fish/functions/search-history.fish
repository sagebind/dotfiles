function search-history
  history --merge
  history | fzf --query=(commandline) | read line

  if test -n "$line"
    commandline $line
  else
    commandline ''
  end
end
