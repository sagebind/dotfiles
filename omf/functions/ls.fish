function ls -d "Show more detailed 'ls' output"
    command ls -l --human-readable --classify --color=always --group-directories-first $argv
end