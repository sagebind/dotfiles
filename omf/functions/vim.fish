function vim -d 'Run Vim configured to work in tmux'
  set -lx TERM xterm-256color
  command vim $argv
end
