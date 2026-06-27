if status is-interactive; and type -fq atuin
  set -gx ATUIN_NOBIND true
  atuin init fish | source
end
