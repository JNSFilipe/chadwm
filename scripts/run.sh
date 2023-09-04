#!/bin/sh

xrdb merge ~/.Xresources 
xrandr -s 1920x1080 -r 60  # Set resolution and refresh rate (run xrandr for more info)
xbacklight -set 10 &
# feh --bg-fill ~/.config/scripts/wallpapers/maroon-cat.png &
hsetroot -solid "#F38BA8"  # Set solid colour as background 
xset r rate 200 50 &       # Set kbd holding delay to 200ms, then produce 50 samples/second
picom &

~/.config/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done
