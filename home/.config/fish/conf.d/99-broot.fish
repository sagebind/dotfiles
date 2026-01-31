if type -fq broot
  broot --print-shell-function fish | source -

  # Create a version of `br` that will append the selected path to the current
  # command line buffer if broot is exited with `:print_path` or similar commands.
  function _broot_commandline
    if br | read --line -l out
      commandline --insert $out
    end
  end
end
