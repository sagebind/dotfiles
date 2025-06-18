#!/usr/bin/env bash

if [ `cat /sys/bus/pci/devices/0000:01:00.0/power_state` != "D3cold" ]; then
    echo "dGPU Active"
fi
