function chain.links.vcs_dirty
  set -q chain_vcs_dirty_glyph
    or set chain_vcs_dirty_glyph "±"

  if git rev-parse 2>/dev/null
    if not command git diff --no-ext-diff --quiet --exit-code 2>/dev/null
      echo purple
      echo "$chain_vcs_dirty_glyph"
    end
  end
end
