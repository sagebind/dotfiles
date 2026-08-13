function dotfiles -d "Apply dotfiles again"
  pushd (dotfiles-path)
  mise bootstrap
  popd
end
