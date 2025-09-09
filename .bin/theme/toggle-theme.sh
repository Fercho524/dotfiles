#!/usr/bin/env bash
set -euo pipefail

ENV_FILE="$HOME/.bin/env.sh"
WAL_SCRIPT="$HOME/.bin/theme/wal.sh"

# Verificar que el archivo exista
if [[ ! -f "$ENV_FILE" ]]; then
  echo "❌ No se encontró $ENV_FILE"
  exit 1
fi

# Detectar valor actual de INTERFACE_SCHEME
CURRENT="$(grep -E '^export INTERFACE_SCHEME=' "$ENV_FILE" | sed -E 's/^export INTERFACE_SCHEME="(.*)"/\1/')"

if [[ "$CURRENT" == "dark" ]]; then
  NEW="light"
elif [[ "$CURRENT" == "light" ]]; then
  NEW="dark"
else
  # Valor inesperado → por defecto cambia a dark
  NEW="dark"
fi

# Reemplazar la línea en el archivo
sed -i -E "s/^export INTERFACE_SCHEME=\".*\"/export INTERFACE_SCHEME=\"$NEW\"/" "$ENV_FILE"

echo "✅ INTERFACE_SCHEME cambiado de '$CURRENT' a '$NEW'"

# Ejecutar script de wal
if [[ -x "$WAL_SCRIPT" ]]; then
  "$WAL_SCRIPT"
else
  echo "⚠️ No se pudo ejecutar $WAL_SCRIPT (no existe o no es ejecutable)"
fi
