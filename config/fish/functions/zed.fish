function zed --wraps zed
  set -l zed_args $argv

  # Open in current window if in a Zed terminal.
  if set -q TERM_PROGRAM; and test $TERM_PROGRAM = zed; and not contains -- --existing $zed_args
    set --prepend zed_args --existing
  end

  if set -q argv[1] # if arguments were provided, run the command
    command zed $zed_args
  else if not isatty stdin # pipe stdin into new buffer if it looks like a pipe
    command zed $zed_args -
  else # or just open a new project window in the current dir
    command zed --new $PWD
  end
end
