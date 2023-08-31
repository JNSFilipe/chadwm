#!/bin/sh

xrdb merge ~/.Xresources #TODO: Take a look into Xresources
xbacklight -set 10 &
feh --bg-fill ~/Pictures/wall/gruv.png & #TODO: config wallpapers
xset r rate 200 50 &
picom &

~/.config/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done
