if status is-interactive; and type -fq atuin
  set -gx ATUIN_SYNC_ADDRESS https://atuin.aperture.coakley.network

  atuin init fish | source
end
