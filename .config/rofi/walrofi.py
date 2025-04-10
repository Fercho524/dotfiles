import json
from sys import argv 

# Dynamic home path
file = "/home/darkplayer/.cache/wal/colors.json"
content = open(file,"r").read()
colors = json.loads(content)

background = colors['special']["background"]
backgroundAlt= colors['special']["background"]
foreground = colors['special']["foreground"]
selected = colors['colors']["color1"]
active = colors['special']["cursor"]
urgent = colors['colors']["color4"]

file_content = f"* {'{'}\n\tbackground: {background};\n\tbackground-alt: {backgroundAlt};\n\t foreground: {foreground};\n\tselected:  {selected};\n\tactive:{active};\n\turgent: {urgent};\n\t{'}'}"


out_file = "/home/darkplayer/.config/rofi/colors/wal.rasi"

with open(out_file,"w") as f:
    f.write(file_content)
