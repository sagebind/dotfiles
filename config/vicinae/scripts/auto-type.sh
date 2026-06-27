#!/bin/sh
# @vicinae.schemaVersion 1
# @vicinae.title Auto-Type Clipboard
# @vicinae.mode silent
# @vicinae.icon 📋️
# @vicinae.keywords ["clipboard"]
# @vicinae.description Automatically types the current contents of the clipboard using ydotool.

niri msg action spawn -- sh -c 'sleep 0.25; wl-paste | ydotool type -f -'
