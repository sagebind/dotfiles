# Path to oh-my-fish.
set -g OMF_PATH $HOME/.local/share/omf

# Path to oh-my-fish configuration.
set -g OMF_CONFIG $HOME/.config/omf

### Configuration required to load oh-my-fish ###
# Note: Only add configurations that are required to be set before oh-my-fish is loaded.
# For common configurations, we advise you to add them to your $OMF_CONFIG/init.fish file or
# to create a custom plugin instead.
function tmux_init
    tmux new-window weechat
    tmux swap-window -s 2 -t 1
    tmux select-window -t 2
end

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
