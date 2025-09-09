#!/bin/bash

# Script para Nautilus que convierte vídeos que no tienen el formato de salida compatible con DaVinci Resolve
# Requiere FFmpeg

# Directorio actual
directory="$(pwd)"

# Lista de extensiones a ignorar
ignore_extensions=(".wav" ".mov")

# Iterar sobre los archivos en la carpeta
for file in "$directory"/*; do
    # Verificar si el archivo es un archivo regular
    if [ -f "$file" ]; then
        # Verificar si la extensión del archivo está en la lista de ignorados
        extension=".${file##*.}"
        if [[ " ${ignore_extensions[@]} " =~ " ${extension} " ]]; then
            echo "Saltando $file (extensión ignorada: $extension)"
            continue
        fi

        # Verificar si ya existe un archivo convertido correspondiente
        base_name="${file%.*}"
        if [ -f "${base_name}_converted.mov" ]; then
            echo "Saltando $file (archivo convertido ya existe)"
            continue
        fi

        # Obtener información del archivo usando ffprobe
        codec_info=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "$file")

        # Verificar si el archivo no tiene el códec y formato de salida esperado
        if [ "$codec_info" != "dnxhd" ]; then
            echo "Convirtiendo $file (no es formato compatible con DaVinci Resolve)..."
            
            # Generar nombre de archivo de salida
            output_file="${base_name}_converted.mov"

            # Convertir a un formato compatible usando FFmpeg
            #ffmpeg -i "$file" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le -f mov "$output_file"
            ffmpeg -i "$file" \
                -c:v libx265 -preset slow -crf 23 -pix_fmt yuv420p \
                -c:a pcm_s16le \
                -movflags +faststart \
                -f mov "$output_file"

            echo "Conversión completada: $output_file"
        else
            echo "Saltando $file (ya tiene el formato esperado)"
        fi
    fi
done

# Notificación de finalización
echo "Proceso completado."
