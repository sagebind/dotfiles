#!/bin/sh
set -eu

# Wrapper around xwayland-satellite that captures output to a log file to aid in debugging.

LOG_DIR="$HOME/.local/var/xwayland-satellite"
mkdir -p "$LOG_DIR"

export RUST_BACKTRACE=full
export RUST_LIB_BACKTRACE=1

xwayland-satellite "$@" >>$LOG_DIR/stdout.log 2>>$LOG_DIR/stderr.log
