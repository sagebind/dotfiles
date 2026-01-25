#!/usr/bin/env fish

if type -fq kitty
  niri msg action spawn -- kitty --single-instance
else if type -fq ghostty
  niri msg action spawn -- ghostty
else if type -fq alacritty
  niri msg action spawn -- alacritty
else if type -fq ptyxis
  niri msg action spawn -- ptyxis
else if type -fq gnome-terminal
  niri msg action spawn -- gnome-terminal
end
