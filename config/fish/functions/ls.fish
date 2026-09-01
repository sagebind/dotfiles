function ls -d "Show more detailed 'ls' output" --wraps ls
  if status is-interactive
    if type -fq eza
      set eza_args --long --no-quotes --git --group-directories-first --mounts
      set -x EZA_ICONS_AUTO 1
      command eza $eza_args $argv
    else
      command ls -FHl --human-readable --color=always --group-directories-first $argv
    end
  else
    command ls $argv
  end
end
