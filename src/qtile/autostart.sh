#!/bin/bash

feh --bg-fill $HOME/.config/bg/bg.png &
$HOME/.config/polybar/launch.sh $
setxkbmap -layout "us,ru" -option "grp:switch,grp:alt_shift_toggle" &
xrandr --output HDMI-1 --mode 1920x1080 --rate 75 &
xset r rate 175 35 &
picom -f
