if type -fq flox
  if not set -q FLOX_ENV
    flox activate -d ~ -m run | source
  end

  if not test (pwd) -ef $HOME; and test -d .flox
    flox activate -m dev | source
  end
end
