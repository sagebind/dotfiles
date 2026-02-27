function set-kbd-backlight-color -a red green blue
  echo "$red $green $blue" | tee /sys/class/leds/rgb:kbd_backlight*/multi_intensity > /dev/null
end
