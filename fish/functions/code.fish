function code
  if not set -q argv[1]
    command code -n $PWD
    return
  end

  set -l files

  while set -q argv[1]
    if test -d $argv[1]
      command code -n $argv[1]
    else
      set files $files $argv[1]
    end

    set -e argv[1]
  end

  if set -q files[1]
    command code -r $files
  end
end
