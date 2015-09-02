function init --on-event init_tmux
    function fish_greeting
        if begin; [ "$TERM" = "screen" ]; not set -q TMUX; end
            tmux new-session -t local \; new-window
            or tmux new-session -s local
            and exit
        end
    end
end
