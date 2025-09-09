#!/bin/bash

# Verificar que se pasó un directorio como argumento
if [ -z "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

DIRECTORIO="$1"

# Verificar que el directorio existe
if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: '$DIRECTORIO' no es un directorio válido."
    exit 1
fi

# Recorremos todos los .md del directorio
for archivo in "$DIRECTORIO"/*.md; do
    # Saltar si no existen .md
    [ -e "$archivo" ] || continue

    # Obtener el nombre del archivo sin extensión
    filename=$(basename "$archivo" .md)

    # Añadir la línea al final del archivo
    echo "- [ ] $filename #youtube #freedomplayer" >> "$archivo"

    echo "Añadido en: $archivo"
done
