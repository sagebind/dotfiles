function init --on-event init_tmux
    function fish_greeting
        if begin; [ "$TERM" = "screen" ]; not set -q TMUX; end
            __tmux_link_session local
            and exit
        else
            # Set useful tmux variables.
            set -g TMUX_WINDOW (tmux display-message -p '#I')
        end
    end
end

function __tmux_link_session -d "Starts a tmux session linked to the given session name"
    tmux new-session -t $argv[1] \; set-option destroy-unattached on \; new-window
    or tmux new-session -s $argv[1]
end
