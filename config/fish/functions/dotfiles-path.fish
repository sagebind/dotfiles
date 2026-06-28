function dotfiles-path -d "Print the absolute path to the dotfiles repo"
  set -l full_path (status current-filename | path resolve)

  while not test -d "$full_path/.git"
    set full_path (path dirname $full_path)

    if test $full_path = "/"
      return 1
    end
  end

  echo $full_path
end
