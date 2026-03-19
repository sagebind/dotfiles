function idea --wraps idea
  if set -q argv[1]; and not string match -q -- '-*' $argv[1]
    set argv[1] (path resolve $argv[1])
  end

  command idea $argv
end
