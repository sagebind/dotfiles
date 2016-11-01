function pgrep -d 'Find a process'
  ps -eo user,pid,%cpu,vsz,tty,args | fzf --multi --header-lines=1 --select-1 --nth=1,2,5,6 --query="$argv" | awk '{ print $2 }'
end
