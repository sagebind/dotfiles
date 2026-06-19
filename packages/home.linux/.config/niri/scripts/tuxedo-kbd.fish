#!/usr/bin/env fish

set -l device_path /sys/class/leds/rgb:kbd_backlight
read -l max_brightness < $device_path/max_brightness
read -l brightness < $device_path/brightness

set -l brightness_levels 0 1 (math -s0 $max_brightness / 2) $max_brightness
set -l brightness_level 1

for i in (seq (count $brightness_levels))
  if test $brightness -lt $brightness_levels[$i]
    set brightness_level $i
    break
  end
end

echo $brightness_levels[$brightness_level] > $device_path/brightness
