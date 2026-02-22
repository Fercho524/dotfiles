#!/bin/bash

grim -g "$(slurp)" - | python ~/.bin/ai/qr_from_screen.py | notify-send