#!/bin/bash

# Especifica la partición que deseas verificar, por ejemplo, /dev/sda1
PARTICION="/dev/nvme0n1p4"

# Ícono para representar el espacio en disco
ICONO="󰋊"

# Obtener el espacio libre en la partición especificada
ESPACIO_LIBRE=$(df -h --output=avail "$PARTICION" | tail -n 1 | tr -d '[:space:]')

# Mostrar el resultado en una línea con el ícono
echo "$ICONO $ESPACIO_LIBRE"