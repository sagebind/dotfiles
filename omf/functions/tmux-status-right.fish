function tmux-status-right
  set -l separator '#[fg=black]│#[default]'
  read -l capacity < /sys/class/power_supply/BAT1/capacity

  if test $capacity -ge 50
    set color '#[fg=green]'
  else if test $capacity -ge 25
    set color '#[fg=green]'
  else
    set color '#[fg=red]'
  end

  printf '%s %s %s %s ' $separator $color(spark 0 $capacity 100 | cut -c 3-6)" $capacity%#[default]" $separator (date '+%a %b %e, %R')
end
