if type -fq flox
  flox activate -d ~ -m run | source

  if not test (pwd) -ef $HOME; and test -d .flox
    flox activate -m dev | source
  end
end
