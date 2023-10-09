#!/bin/bash

FILE="$HOME/.cache/eww_launch.xyz"

if [[ ! $(pidof eww) ]]; then
	eww daemon
	sleep 1
fi

monitors=($(hyprctl monitors -j | jq -r '.[] | .id'))
for i in "${!monitors[@]}"; do
  if [[ ! -f "$FILE" ]]; then
	  eww open-many bar$i
	  touch "$FILE"
  else
	  eww close-all && killall eww
	  rm "$FILE"
  fi
done
