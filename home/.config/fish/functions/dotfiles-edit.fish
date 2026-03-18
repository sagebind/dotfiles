function dotfiles-edit -d "Open the dotfiles repo in an editor"
  command $EDITOR (dotfiles-path)
end
