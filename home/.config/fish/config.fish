# Hide greeting
function fish_greeting
end

# Better titles
function fish_title
  test (count $argv) -gt 0
    and echo $argv[1]
    or prompt_pwd
end

set -q EDITOR
  or set -gx EDITOR code -w
set -gx FILTER fzf
set -gx LESS RS
