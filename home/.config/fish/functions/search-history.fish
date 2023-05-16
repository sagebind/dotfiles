function search-history
  builtin history --merge
  builtin history | command $FILTER --query (commandline) | read line

  if test -n "$line"
    commandline $line
  else
    commandline ''
  end
end
