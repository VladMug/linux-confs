# Путь к файлу блокировки
lockfile="volume_control.lock"

# Проверка наличия файла блокировки
if [ -f "$lockfile" ]; then
  exit 1
fi

# Создание файла блокировки
touch "$lockfile"

# Получаем PID активного окна
pid=$(hyprctl activewindow -j | jq -r '.pid')

# Массив id потоков
mapfile -t ids < <(pw-dump | jq -r --arg pid "$pid" '
  .[] 
  | select(.type == "PipeWire:Interface:Node") 
  | select(.info.props["application.process.id"] == ($pid | tonumber)) 
  | .id
')

# Увеличение громкости потока
wpctl set-volume "${ids[0]}" 5%- --limit 2.0

# Получение громкости первого окна
strVol=$(wpctl get-volume "${ids[0]}")
vol=$(echo "$strVol" | awk '{print $2}')

for id in "${ids[@]}"; do
  # Синхранизация громкости окон 
  wpctl set-volume "$id" "$vol"
done

# Удаление файла блокировки
rm -f "$lockfile"
