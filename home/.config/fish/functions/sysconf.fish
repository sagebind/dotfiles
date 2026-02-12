function sysconf -d "Wrapper around Git to manage system configuration files"
  git --git-dir=/.dotfiles --work-tree=/ $argv
end
