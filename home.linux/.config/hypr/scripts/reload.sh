#!/bin/sh

pkill libinput-gestures
pkill waybar
pkill hyprpanel
pkill walker

hyprctl reload

hyprctl dispatch -- exec libinput-gestures
hyprctl dispatch -- exec waybar
hyprctl dispatch -- exec walker --gapplication-service
# hyprctl dispatch -- exec hyprpanel
