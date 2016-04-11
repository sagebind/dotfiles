function atom
  if set -q argv[1]
    command atom $argv
  else
    atom "$PWD"
  end
end
