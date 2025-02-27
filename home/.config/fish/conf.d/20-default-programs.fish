if type -fq sk
  set -gx FILTER sk
else if type -fq fzf
  set -gx FILTER fzf
end

if not set -q EDITOR
  set -gx EDITOR (type -fp code) -w
end

# Default program options
set -gx LESS RS
