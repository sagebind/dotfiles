function dotfiles -d "Apply dotfiles again"
  make -C (dotfiles-path) apply
end
