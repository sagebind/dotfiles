function tmux-status-right
  set -l separator '#[fg=black]│#[default]'
  read -l capacity < /sys/class/power_supply/BAT1/capacity

  if test $capacity -ge 50
    echo -n '#[fg=green]'
  else if test $capacity -ge 25
    echo -n '#[fg=green]'
  else
    echo -n '#[fg=red]'
  end

  printf '%s %s %s ' (spark 0 $capacity 100 | cut -c 3-6)" $capacity%#[default]" $separator (date '+%a %b %e, %R')
end
