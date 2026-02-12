function dotfiles -d "Apply dotfiles again"
  make -C (dotfiles-path) $argv
end
