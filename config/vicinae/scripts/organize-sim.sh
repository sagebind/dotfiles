#!/bin/sh
# @vicinae.schemaVersion 1
# @vicinae.title Organize Simulate
# @vicinae.mode terminal
# @vicinae.icon icons/organize.png

# Disable progress bars which don't work inside Vicinae.
export TERM=dumb

mise exec -- organize sim
