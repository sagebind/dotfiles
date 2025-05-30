#!/usr/bin/env bash

if ! upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -q 'state: *charging'; then
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/energy-rate/ { printf "%.1f W | iconName=battery-full-charged-symbolic", $2 }'
else
    echo "---"
fi
