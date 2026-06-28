function dnf-use -a package
  mise -C (dotfiles-path) bootstrap packages use dnf:$package
end
