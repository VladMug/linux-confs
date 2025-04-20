#!/bin/bash

player="firefox"

while true; do
  status="$(playerctl --player=$player status 2>/dev/null)"
  
  if [ "$status" = "" ]; then
    output=" ⏹ "
  elif [ "$status" = "Playing" ]; then
    text="$(playerctl --player=$player metadata --format '⏸ {{ artist }} - {{ title }}')"
  elif [ "$status" = "Paused" ]; then
    text="$(playerctl --player=$player metadata --format '▶ {{ artist }} - {{ title }}')"
  fi

  # Обрезаем текст, если он слишком длинный
  if [ ${#text} -gt 40 ]; then
    output=" ${text:0:40}... "
  else
    output=" ${text} "
  fi

  # Выводим результат (можно добавить `clear` для "обновления" строки)
  echo "$output"  # `-ne` для вывода в той же строке
  sleep 0.5  # Задержка 1 секунда
done
