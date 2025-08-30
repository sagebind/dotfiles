function open -d 'Open files using the default associated application(s)'
  set -q argv[1]
    or set argv[1] (pwd)

  if type -fq xdg-open
    command xdg-open $argv >/dev/null 2>/dev/null &
    disown
  else if type -fq open
    command open $argv
  else if contains open (builtin --names)
    eval builtin open $argv
  else
    echo "error: no open mechanism available" >&2
    return 1
  end
end
