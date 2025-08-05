function ls -d "Show more detailed 'ls' output" --wraps ls
  if type -fq eza
    set -x EZA_ICONS_AUTO 1

    command eza --long --no-quotes --git --smart-group --mounts --extended $argv
  else
    command ls -FHl --human-readable --color=always --group-directories-first $argv
  end
end
