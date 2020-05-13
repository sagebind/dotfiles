function git-merge-subrepo -a name remote subtree
  set -l branch _merging_$name

  git remote add $name $remote
  git fetch --no-tags $name master
  git checkout -b $branch $name/master

  git filter-branch --index-filter \
      'git ls-files -s | gsed "s-\t\"*-&'$subtree'/-" |
      GIT_INDEX_FILE=$GIT_INDEX_FILE.new \
      git update-index --index-info &&
      mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"
      ' --tag-name-filter cat -f -- $branch

  git checkout master
  git merge --allow-unrelated-histories -m "Import $name into shared repo" $branch
  git branch -D $branch
  git remote rm $name
end
