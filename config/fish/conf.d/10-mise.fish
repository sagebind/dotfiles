if type -fq mise
  if type -fq hostname; and hostname | string match -q "MacBook-Pro-StephenCoakley"
    set -gx MISE_ENV widen
  end

  mise activate fish | source
  mise completion fish | source
end
