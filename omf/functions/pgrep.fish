function pgrep -d 'Find a process' -a pattern
  ps aux | fzf --header-lines=1 --query="$pattern" | awk '{ print $2 }'
end
