#!/usr/bin/env fish
# @vicinae.schemaVersion 1
# @vicinae.title Edit Dotfiles
# @vicinae.mode silent

niri msg action spawn -- $EDITOR (dotfiles-path)
echo "Opened dotfiles in "(path basename -- (string split -f1 -- ' ' "$EDITOR"))
