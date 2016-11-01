# Run asciinema in a separate terminal emulator without breaking tmux.
function asciinema -d "Record and share your terminal sessions, the right way."
    if begin; test "$argv[1]" = rec; or test "$argv[1]" = play; end
        set -l shell_command "fish -c \"set -e TMUX; command asciinema $argv\""
        gnome-terminal --working-directory=(pwd) --command="$shell_command"
        return 0
    end

    command asciinema $argv
end
