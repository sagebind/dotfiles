# Hide greeting
function fish_greeting
end

# Better titles
function fish_title
  test (count $argv) -gt 0
    and echo $argv[1]
    or prompt_pwd
end

fish_add_path $HOME/.local/bin

# Default programs
type -fq sk
  and set -gx FILTER sk
  or set -gx FILTER fzf

if not set -q EDITOR; or test "$TERM_PROGRAM" = vscode
  set -gx EDITOR (which code) -w
end

# Default program options
set -gx LESS RS
