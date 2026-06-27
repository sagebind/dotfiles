function ssh --wraps ssh
  set -x TERM xterm-256color
  command ssh $argv
end
