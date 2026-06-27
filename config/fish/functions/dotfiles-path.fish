function dotfiles-path -d "Print the absolute path to the dotfiles repo"
  status --current-filename \
    | path resolve \
    | path dirname \
    | path dirname \
    | path dirname \
    | path dirname \
    | path dirname
end
