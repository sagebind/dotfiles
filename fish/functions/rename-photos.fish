function rename-photos -d "Renames photos to a uniform pattern"
    jhead -n%Y-%m-%d\ %H.%M.%S $argv
end
