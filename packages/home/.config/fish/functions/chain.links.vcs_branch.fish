function chain.links.vcs_branch
  set -q chain_vcs_branch_glyph
    or set chain_vcs_branch_glyph "⎇"

  if git rev-parse 2>/dev/null
    if set -l branch_name (
      command git symbolic-ref --short HEAD 2>/dev/null
        or command git show-ref --head -s --abbrev | head -n1 2>/dev/null
      )

      echo blue
      echo "$chain_vcs_branch_glyph $branch_name"
    end
  end
end
