#!/usr/bin/env bash

{
    read BATTERY_STATE
    read ENERGY_RATE
} <<< $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '
    /state:/ {
        print $2
    }
    /energy-rate:/ {
        printf "%.1f", $2
    }
')

case "$BATTERY_STATE" in
    charging | fully-charged)
        echo "---"
        ;;

    *)
        echo "<small>$ENERGY_RATE W</small> | iconName=battery-full-charged-symbolic"
        ;;
esac
