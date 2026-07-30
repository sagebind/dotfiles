function zed --wraps zed
  set -l args $argv

  if test $TERM_PROGRAM = zed; and not contains -- --existing $args
    set --prepend args --existing
  end

  if set -q args[1]
    command zed $args
  else if not isatty stdin
    command zed -
  else
    command zed --new $PWD
  end
end
