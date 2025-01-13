function ls -d "Show more detailed 'ls' output" --wraps ls
  if type -fq lla
    command lla $argv
  else if type -fq eza
    command eza -l $argv
  else
    command ls -FHl --human-readable --color=always --group-directories-first $argv
  end
end
