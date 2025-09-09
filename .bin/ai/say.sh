#!/bin/bash

# Elimina las instancias anteriores para no saturar la ram y el cpu
killall balcon.exe

# Obtiene el texto del portapapeles y lo guarda en un archivo
echo "$(xclip -selection clipboard -o)" > /tmp/say.txt

# Utiliza el sintetizador de voz para pronunciar el texto, hay que instalar el say antes
say -n "Jorge" -f /tmp/say.txt -enc utf8

killall balcon.exe