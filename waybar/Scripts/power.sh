#!/bin/bash

# Функция для обработки прерывания
cleanup() {
    echo "Скрипт прерван, выключение отменено."
    exit 0
}

# Устанавливаем обработчик сигналов прерывания
trap cleanup SIGINT SIGTERM

# Время обратного отсчёта в секундах (по умолчанию 60)
COUNTDOWN=${1:-5}

echo "Запущен обратный отсчёт до выключения компьютера. Нажмите Ctrl+C для отмены."

while [ $COUNTDOWN -gt 0 ]; do
    echo "Осталось $COUNTDOWN секунд..."
    sleep 1
    ((COUNTDOWN--))
done

echo "Выключаем компьютер..."
shutdown -h now
