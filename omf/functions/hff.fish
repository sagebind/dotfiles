function hff -a branch
    git checkout hotfix/$branch
    git stash save "$branch"
    git checkout master
    git pull --rebase
    git checkout develop
    git pull --rebase
    git checkout hotfix/$branch
    git flow hotfix finish -p
    git checkout master
    git stash list | grep -q "$branch"
        and git stash pop
end
