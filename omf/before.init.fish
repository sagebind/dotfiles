# Load env variables
if test -f ~/.env.fish
    source ~/.env.fish
end

# Set the terminal window to use a dark GTK theme.
if begin; type -q xprop; and set -q WINDOWID; end
    xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT "dark" -id $WINDOWID
end
