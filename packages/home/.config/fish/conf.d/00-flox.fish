if type -fq flox
  and status is-interactive
  and begin
    not status is-login
    or status build-info | string match -q '*apple*'
  end

  if not set -q FLOX_ENV
    flox activate -d ~ -m run | source
  end

  if not test (pwd) -ef $HOME; and test -d .flox
    flox activate -m dev | source
  end
end
