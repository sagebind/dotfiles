#!/usr/bin/env fish
# @vicinae.schemaVersion 1
# @vicinae.title Reboot into Firmware
# @vicinae.mode silent
# @vicinae.keywords ["bios", "uefi"]
# @vicinae.description Reboot into the system firmware setup (BIOS/UEFI).

systemctl reboot --firmware-setup
