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
