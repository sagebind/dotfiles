#!/bin/sh

# Some goofiness to get Resolve to work under Hyprland.

exec gamescope -w 2560 -h 1560 -W 2560 -H 1560 -S integer --force-windows-fullscreen \
    env \
    __NV_PRIME_RENDER_OFFLOAD=1 \
    __VK_LAYER_NV_optimus=NVIDIA_only \
    __GLX_VENDOR_LIBRARY_NAME=nvidia \
    DRI_PRIME=1 \
    /usr/bin/davinci-resolve
