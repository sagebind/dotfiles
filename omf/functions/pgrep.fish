function pgrep -d 'Find a process' -a pattern
  ps -eo user,pid,%cpu,vsz,tty,args | fzf --multi --header-lines=1 --nth=1,2,5,6 --query="$pattern" | awk '{ print $2 }'
end
