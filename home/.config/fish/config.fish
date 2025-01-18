# Hide greeting
function fish_greeting
end

# Better titles
function fish_title
  test (count $argv) -gt 0
    and echo $argv[1]
    or prompt_pwd
end

# Default programs
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
