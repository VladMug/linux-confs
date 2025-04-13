#!/bin/bash

player="firefox"

status="$(playerctl --player=$player status 2>/dev/null)"
if [ "$status" = "" ]; then
  echo " ⏹ "
  exit
elif [ "$status" = "Playing" ]; then
  text="$(playerctl --player=$player metadata --format '⏸ {{ artist }} - {{ title }}')"
elif [ "$status" = "Paused" ]; then
  text="$(playerctl --player=$player metadata --format '▶ {{ artist }} - {{ title }}')"
fi

if [ ${#text} -gt 60 ]; then
  echo " ${text:0:60}... "
else
  echo " ${text} "
fi

