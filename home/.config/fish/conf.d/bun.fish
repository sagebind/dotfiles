set --export BUN_INSTALL "$HOME/.bun"

if test -d $BUN_INSTALL
  fish_add_path --global $BUN_INSTALL/bin
end
