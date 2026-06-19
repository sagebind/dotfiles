function chain.links.pwd
  set -q chain_project_glyph
    or set -l chain_project_glyph '@'

  set -l prefix ''
  set -l path "$PWD"

  # Replace either HOME with ~ or abbreviate project root.
  if git rev-parse 2>/dev/null
    set -l root (command git rev-parse --show-toplevel 2>/dev/null)
    set path (string replace $root '' "$path")
    set prefix @(basename $root)
  else
    set path (string replace ~ '~' "$path")
  end

  # Shorten path segments.
  set path (string replace -ar '(\.?[^/]{1})[^/]*/' '$1/' "$path")

  echo cyan
  echo "$prefix$path"
end
