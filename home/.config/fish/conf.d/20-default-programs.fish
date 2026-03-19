if type -fq sk
  set -gx FILTER sk

  # Also alias fzf to sk for muscle memory.
  function fzf --wraps=sk
    sk $argv
  end
else if type -fq fzf
  set -gx FILTER fzf
end

# Default program options
set -gx LESS RS
