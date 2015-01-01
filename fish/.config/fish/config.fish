# color variables
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# common root commands
function reboot
    sudo reboot
end

# shell tools
function reload
    . ~/.config/fish/config.fish
end

# alias for renaming photos to a uniform pattern
function rename-photos
    jhead -n%Y-%m-%d\ %H.%M.%S $argv
end

# remove crash files
function remove-crash
    sudo rm /var/crash/*
end

# apt-get shortcuts
function apt-install
    sudo apt-get install $argv
end
function apt-search
    apt-cache search $argv
end
function apt-show
    apt-cache show $argv
end
function apt-purge
    sudo apt-get --purge remove $argv
end
function apt-remove
    sudo apt-get remove $argv
end
function apt-up
    sudo apt-get update and sudo apt-get upgrade
end
function apt-policy
    LANG=C apt-cache policy
end

# bluetooth audio
function bluetooth-audio
    pactl load-module module-bluetooth-discover
end

function weather
    command weather -q KJVL | awk '{if(NR>2)print}'
end

function ls --description "Show more detailed 'ls' output"
    command ls -l -A --human-readable --classify --color=always --group-directories-first $argv | less -XRF
end

function fish_greeting
    #echo "Welcome back, "(whoami)"."
    #fortune -s | cowsay -f tux
    if begin; [ "$TERM" = "screen" ]; not set -q TMUX; end
        tmux
    end
end

# Fish git prompt
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

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
