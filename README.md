# Monitoreo Basico del Sistema con Whiptail

Este script de shell permite monitorear el uso del CPU, memoria, disco y el número de procesos activos y dormidos en un sistema. Utiliza la herramienta whiptail para mostrar la información en una interfaz gráfica de diálogo en la terminal.

## Requisitos
- Un sistema con una distribución basada en Linux

## Uso del programa
Una vez tengas el script descargado ejecuta este comando estando en el mismo directorio donde se encuentra el script
```bash
  bash monitoro_full.sh
```
Primero el script verificará si whiptail está instalado. Si no lo está, se intentará realizar la instalación automáticamente. Si la instalación falla, recibirás un mensaje de error y deberás instalar whiptail manualmente.

Una vez que whiptail esté instalado, se mostrará una ventana de diálogo que contiene información sobre el uso del sistema, incluyendo el uso de CPU, memoria, disco y el número de procesos en ejeecucion y procesos dormidos.

Puedes actualizar los valores mostrados seleccionando "Actualizar" en la ventana de diálogo. Esto volverá a obtener y mostrar la información actualizada.

Si deseas salir del script, selecciona "Salir" en la ventana de diálogo.
