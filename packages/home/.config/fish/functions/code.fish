function code --wraps code
  set -x GTK_IM_MODULE xim

  if set -q argv[1]
    command code $argv
  else if not isatty stdin
    command code -
  else
    command code -n $PWD
  end
end
