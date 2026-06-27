function chain.links.vcs_stashed
  set -q chain_vcs_stashed_glyph
    or set -l chain_vcs_stashed_glyph '*'

  if git rev-parse 2>/dev/null
    if git rev-parse --verify --quiet refs/stash 2>/dev/null > /dev/null
      echo 999
      echo "$chain_vcs_stashed_glyph"
    end
  end
end
