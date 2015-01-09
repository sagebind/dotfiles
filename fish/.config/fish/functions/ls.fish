function ls --description "Show more detailed 'ls' output"
    command ls -l -A --human-readable --classify --color=always --group-directories-first $argv | less -XRF
end
