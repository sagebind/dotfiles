#!/bin/sh

# Wrapper around xwayland-satellite that captures output to a log file to aid in debugging.

LOG_DIR="$HOME/.local/var/xwayland-satellite"
mkdir -p "$LOG_DIR"
exec xwayland-satellite "$@" >>$LOG_DIR/stdout.log 2>>$LOG_DIR/stderr.log
