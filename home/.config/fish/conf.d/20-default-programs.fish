if type -fq sk
  set -gx FILTER sk

  # Also alias fzf to sk for muscle memory.
  function fzf --wraps=sk
    sk $argv
  end
else if type -fq fzf
  set -gx FILTER fzf
end

if not set -q EDITOR
  # If there is a desktop environment, use Visual Studio Code as the default
  # editor.
  if set -q DISPLAY; or not string match -i linux (uname)
    set -gx EDITOR (type -fp code) -w
  # Otherwise, use Microsoft Edit if available.
  else if type -fq edit
    set -gx EDITOR (type -fp edit)
  end
end

# Default program options
set -gx LESS RS
