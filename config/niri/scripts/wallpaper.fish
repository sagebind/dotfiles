#!/usr/bin/env fish

set -l wallpaper_path "/mnt/data/Seafile/Wallpapers/Animated/hornet-green-cave-hollow-knight-silksong-moewalls-com.mp4"

if type -fq phonto
  igpu-run phonto --pause-below 30 $wallpaper_path
end
