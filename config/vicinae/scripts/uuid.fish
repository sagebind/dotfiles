#!/usr/bin/env fish
# @vicinae.schemaVersion 1
# @vicinae.title Generate UUID
# @vicinae.mode silent
# @vicinae.icon 🎲

set -l uuid (uuidgen)
echo $uuid
niri msg action spawn -- sh -c "sleep 0.25; wl-paste | ydotool type $uuid"
