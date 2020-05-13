function ls -d "Show more detailed 'ls' output"
    command ls -FHl --human-readable --color=always --group-directories-first $argv
end
