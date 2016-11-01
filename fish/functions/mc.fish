function mc
  set -l wdfile "/tmp/mc.pwd.%self"
  command mc -x --printwd=$wdfile $argv

  if test -f $wdfile
    read -l dir < $wdfile
    test -d "$dir"
      and cd "$dir"
    rm $wdfile
  end
end
