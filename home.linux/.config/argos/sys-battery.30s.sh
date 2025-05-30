#!/usr/bin/env bash

BAT_INFO=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)

if ! echo "$BAT_INFO" | grep -q 'state: *charging'; then
    echo "$BAT_INFO" | awk '/energy-rate/ { printf "<small>%.1f W</small> | iconName=battery-full-charged-symbolic", $2 }'
else
    echo "---"
fi
