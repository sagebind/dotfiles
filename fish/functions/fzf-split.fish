function fzf-split -d 'Run fzf in a tmux split pane'
  if begin; set -q TMUX; and test "$argv[1]" != '-h' -a "$argv[1]" != '--help'; end
    set -l random (tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 12)
    set -l in /tmp/fzf.$random.in
    set -l out /tmp/fzf.$random.out

    if not isatty
      mkfifo $in $out
      cat ^/dev/null > $in &

      set -q argv[1]
        and set -l args (printf '\'%s\' ' $argv)
      tmux split-window "cd '$PWD'; command fzf $args < $in > $out"
    else
      mkfifo $out

      set -q argv[1]
        and set -l args (printf '\'%s\' ' $argv)
      tmux split-window "cd '$PWD'; command fzf $args > $out"
    end

    cat $out
    rm -f $in $out
  else
    command fzf $argv
  end
end
