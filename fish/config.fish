# Always run inside tmux
function fish_greeting
    if begin; [ "$TERM" = "screen" ]; not set -q TMUX; end
        tmux new-session -t local \; new-window
        or tmux new-session -s local
        and exit
    end
end

# Set the oh-my-fish config path
set fish_path $HOME/.oh-my-fish

# Load oh-my-fish configuration
. $fish_path/oh-my-fish.fish

# Use the "l" fish theme and some options
Theme "l"

# Load some plugins
Plugin "apt"
Plugin "autojump"
Plugin "bd"
Plugin "composer"
Plugin "evernote"
Plugin "extract"
Plugin "peco"
Plugin "perforce"
Plugin "theme"
