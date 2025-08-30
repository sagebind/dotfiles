#!/bin/sh

PIDFILE="$XDG_RUNTIME_DIR/rofi.pid"

if [ -f "$PIDFILE" ]; then
    PID=$(cat "$PIDFILE")

    if kill "$PID" 2>/dev/null; then
        exit 0
    fi
fi

rofi -pid $XDG_RUNTIME_DIR/rofi.pid \
    -theme $HOME/.config/rofi/theme.rasi \
    -modes combi \
    -normal-window \
    -show combi
