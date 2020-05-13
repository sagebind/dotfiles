# Load env variables
if test -f ~/.env.fish
    source ~/.env.fish
end

# Hide greeting
function fish_greeting
end

# Better titles
function fish_title
  test (count $argv) -gt 0
    and echo $argv[1]
    or prompt_pwd
end

set -gx EDITOR code -w
set -gx FILTER fzf
set -gx LESS RS

# Set the terminal window to use a dark GTK theme.
if begin; type -q xprop; and set -q WINDOWID; end
    xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT "dark" -id $WINDOWID
end
