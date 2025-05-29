#!/usr/bin/env bash

if [ `cat /sys/bus/pci/devices/0000:01:00.0/power_state` != "D3cold" ]; then
    echo "&#8203;<span color='#0F0' weight='normal'>dGPU Active</span> | iconName=nobara-nvidia"
else
    echo "---"
fi
