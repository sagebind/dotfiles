#!/usr/bin/env fish

if string match -q '*App ID: "kitty"*' (niri msg focused-window)
  niri msg action spawn -- kitty fish -C '
    niri msg action focus-column-left
    niri msg action consume-window-into-column
    niri msg action set-column-display tabbed
    niri msg action focus-window-bottom
  '
else
  niri msg action spawn -- kitty
end
