function ls -d "Show more detailed 'ls' output"
    command ls --almost-all -l --human-readable --classify --color=always --group-directories-first $argv
end
