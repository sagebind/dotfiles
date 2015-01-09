# color variables
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# fish git prompt
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# git status chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function fish_greeting
    #echo "Welcome back, "(whoami)"."
    #fortune -s | cowsay -f tux
    if begin; [ "$TERM" = "screen" ]; not set -q TMUX; end
        tmux
        exit
    end
end

function fish_prompt
    set last_status $status

    # display user and host name
    printf "%s@%s" (whoami) (hostname)

    # display working directory
    set_color $fish_color_cwd
    printf ' %s' (prompt_pwd)
    set_color normal

    # display git status
    printf '%s' (__fish_git_prompt)

    printf '> '
    set_color normal
end

function reboot
    sudo reboot
end

function reload --description "Reloads Fish configuration"
    . ~/.config/fish/config.fish
end
