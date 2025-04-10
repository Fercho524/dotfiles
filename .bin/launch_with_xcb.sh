#!/bin/bash

# Lista de aplicaciones que requieren QT_QPA_PLATFORM=xcb
apps_with_xcb=("vktablet" "otra_aplicacion" "otra_mas")

app_name=$(basename "$1")

if [[ " ${apps_with_xcb[@]} " =~ " ${app_name} " ]]; then
  QT_QPA_PLATFORM=xcb "$@"
else
  "$@"
fi
