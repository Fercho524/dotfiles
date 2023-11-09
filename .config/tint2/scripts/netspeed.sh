#!/bin/bash

stdbuf -oL bwm-ng -o csv -t 1000 | stdbuf -oL awk -F ';' '/total/ { printf "  %.0f kb/s \n", ($5/1.0e3) }'