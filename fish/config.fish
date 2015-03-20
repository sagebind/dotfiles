# always run inside tmux
function fish_greeting
    if begin; [ "$TERM" = "screen" ]; not set -q TMUX; end
        tmux -2; and exit
    end
end

# set the oh-my-fish config path
set fish_path $HOME/.oh-my-fish

# use the "l" fish theme and some options
set fish_theme l

# set some plugins to be loaded
set fish_plugins theme autojump bd composer evernote

# load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

function reboot
    sudo reboot
end
