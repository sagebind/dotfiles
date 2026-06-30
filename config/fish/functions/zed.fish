function zed --wraps zed
  if set -q argv[1]
    command zed $argv
  else if not isatty stdin
    command zed -
  else
    command zed -n $PWD
  end
end
