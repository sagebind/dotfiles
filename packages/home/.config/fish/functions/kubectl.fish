function kubectl --wraps kubectl
  switch $argv[1]
    case ctx
      command kubectx $argv[2..]
    case ns
      command kubens $argv[2..]
    case '*'
      command kubectl $argv
  end
end
