#!/bin/sh
# @vicinae.schemaVersion 1
# @vicinae.title Screenshot Window
# @vicinae.mode silent

niri msg action spawn-sh -- "sleep 2 && niri msg action screenshot-window"
