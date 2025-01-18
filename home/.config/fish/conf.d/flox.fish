if type -fq flox
  flox activate -d ~ -m run | source

  if not test (pwd) -ef $HOME; and test -d .flox
    flox activate -m run | source
  end
end
