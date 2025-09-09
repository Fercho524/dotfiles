#!/usr/bin/env bash
set -euo pipefail

CONFIG="${HOME}/.config/dunst/dunstrc"
WAL_SH="${HOME}/.cache/wal/colors.sh"

if [[ ! -f "$WAL_SH" ]]; then
    echo "No se encontró ${WAL_SH}. Ejecuta 'wal -i <imagen>' primero."
    exit 1
fi

# Cargar solo las variables color0..15
eval "$(grep -E '^color[0-9]+=' "$WAL_SH")"

# Mapear colores a usar
BG="${color0}"
FG="${color7}"
HL="${color3}"

# Reemplazar los colores existentes en cada sección de urgencia
sed -i -E \
    -e '/^\[urgency_low\]/,/^\[/{s/^[[:space:]]*background[[:space:]]*=.*/    background = "'"$BG"'"/}' \
    -e '/^\[urgency_low\]/,/^\[/{s/^[[:space:]]*foreground[[:space:]]*=.*/    foreground = "'"$FG"'"/}' \
    -e '/^\[urgency_low\]/,/^\[/{s/^[[:space:]]*highlight[[:space:]]*=.*/    highlight = "'"$HL"'"/}' \
    -e '/^\[urgency_normal\]/,/^\[/{s/^[[:space:]]*background[[:space:]]*=.*/    background = "'"$BG"'"/}' \
    -e '/^\[urgency_normal\]/,/^\[/{s/^[[:space:]]*foreground[[:space:]]*=.*/    foreground = "'"$FG"'"/}' \
    -e '/^\[urgency_normal\]/,/^\[/{s/^[[:space:]]*highlight[[:space:]]*=.*/    highlight = "'"$HL"'"/}' \
    -e '/^\[urgency_critical\]/,/^\[/{s/^[[:space:]]*background[[:space:]]*=.*/    background = "'"$BG"'"/}' \
    -e '/^\[urgency_critical\]/,/^\[/{s/^[[:space:]]*foreground[[:space:]]*=.*/    foreground = "'"$FG"'"/}' \
    -e '/^\[urgency_critical\]/,/^\[/{s/^[[:space:]]*highlight[[:space:]]*=.*/    highlight = "'"$HL"'"/}' \
    "$CONFIG"

echo "✔ Colores reemplazados en $CONFIG"
echo "   background = $BG"
echo "   foreground = $FG"
echo "   highlight  = $HL"
echo "ℹ️ Recarga dunst: killall dunst && dunst &"
