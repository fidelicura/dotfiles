#!/bin/bash

feh --bg-fill $HOME/.config/bg/bg.png &
setxkbmap -layout "us,ru" -option "grp:switch,grp:alt_shift_toggle" &
xrandr -s 1920x1080 -r 75 &
xset r rate 100 30 &
picom -f
