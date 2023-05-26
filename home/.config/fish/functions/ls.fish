function ls -d "Show more detailed 'ls' output" --wraps ls
    command ls -FHl --human-readable --color=always --group-directories-first $argv
end
