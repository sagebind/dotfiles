#!/bin/sh

if [ -f ~/.local/share/pluto-kbd.txt ]; then
    for f in /sys/class/leds/rgb:kbd_backlight*/multi_intensity; do
        cat ~/.local/share/pluto-kbd.txt > $f &
    done

    wait
fi
