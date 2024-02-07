# Hide greeting
function fish_greeting
end

# Better titles
function fish_title
  test (count $argv) -gt 0
    and echo $argv[1]
    or prompt_pwd
end

# Add a dim horizontal bar between commands for better readability
function prompt_separator -a command --on-event fish_postexec
  if isatty stdout; and test "$command" != "clear"
    echo
    set_color 2F2F2F black
    string repeat -n$COLUMNS '▔'
    set_color normal
  end
end

# Default programs
type -fq sk
  and set -gx FILTER sk
  or set -gx FILTER fzf

if not set -q EDITOR
  set -gx EDITOR (which code) -w
end

# Default program options
set -gx LESS RS
