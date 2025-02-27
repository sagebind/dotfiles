function search-history
  builtin history --merge
  builtin history | filter (commandline) | read line

  if test -n "$line"
    commandline $line
  else
    commandline ''
  end
end
