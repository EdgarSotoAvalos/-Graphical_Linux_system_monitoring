#!/bin/bash

# Verificar si whiptail está instalado
if ! command -v whiptail >/dev/null 2>&1; then
  echo "whiptail no está instalado. Instalando..."
  
  sudo apt-get install -y whiptail
  
  # Verificar si la instalación fue exitosa
  if ! command -v whiptail >/dev/null 2>&1; then
    echo "No se pudo instalar whiptail. Por favor, instálalo manualmente."
    exit 1
  fi
fi

echo "whiptail está instalado. Continuando con el script."

while true; do
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    memory_usage=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
    disk_usage=$(df -h | awk '$NF=="/"{printf "%s", $5}')
    processes_active=$(ps -eo state | grep -E 'R$' | wc -l)
    processes_sleeping=$(ps -eo state | grep -E 'S$' | wc -l)

    whiptail --title "Monitoreo del sistema" --msgbox "Uso de CPU: $cpu_usage\nUso de memoria: $memory_usage\nUso de disco: $disk_usage\nProcesos activos: $processes_active\nProcesos dormidos: $processes_sleeping" 13 30

    choice=$(whiptail --title "Opciones" --yesno "¿Deseas actualizar los valores?\n" 10 50 --yes-button "Actualizar" --no-button "Salir" 3>&1 1>&2 2>&3)
    exit_status=$?

    if [ $exit_status -eq 0 ]; then
        continue
    fi

    if [ $exit_status -ne 0 ]; then
        break
    fi

    sleep 1
done
