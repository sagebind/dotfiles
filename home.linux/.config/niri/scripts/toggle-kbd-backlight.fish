#!/usr/bin/env fish

read -l max_brightness < /sys/class/leds/rgb:kbd_backlight/max_brightness
read -l brightness < /sys/class/leds/rgb:kbd_backlight/brightness

if test $brightness -gt 0
  echo 0 > /sys/class/leds/rgb:kbd_backlight/brightness
else
  echo $max_brightness > /sys/class/leds/rgb:kbd_backlight/brightness
end
