#!/bin/sh

bwm-ng -o csv -c 1 | awk -F ';' '/total/ { printf "  %.0f kb/s \n", ($5/1.0e3) }'
