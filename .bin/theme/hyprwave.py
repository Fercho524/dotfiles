#!/usr/bin/env python3

import json
import re
import argparse
from pathlib import Path
import shutil

# ==========================
# ARGUMENTS
# ==========================

def hex_to_rgba(hex_color, alpha):
    hex_color = hex_color.lstrip("#")
    r = int(hex_color[0:2], 16)
    g = int(hex_color[2:4], 16)
    b = int(hex_color[4:6], 16)
    return f"rgba({r}, {g}, {b}, {alpha})"

parser = argparse.ArgumentParser(
    description="Generate CSS root and visualizer from pywal colors.json"
)

parser.add_argument(
    "--colors",
    required=True,
    help="Path to pywal colors.json"
)

parser.add_argument(
    "--style",
    required=True,
    help="Path to style.css file"
)

parser.add_argument(
    "--backup",
    action="store_true",
    help="Create backup of style.css before modifying"
)

args = parser.parse_args()

colors_path = Path(args.colors).expanduser()
style_path = Path(args.style).expanduser()

# ==========================
# VALIDATION
# ==========================

if not colors_path.exists():
    raise FileNotFoundError(f"Colors file not found: {colors_path}")

if not style_path.exists():
    raise FileNotFoundError(f"Style file not found: {style_path}")

# ==========================
# BACKUP (optional)
# ==========================

if args.backup:
    backup_path = style_path.with_suffix(".css.bak")
    shutil.copy(style_path, backup_path)
    print(f"Backup created: {backup_path}")

# ==========================
# LOAD WAL
# ==========================

with open(colors_path) as f:
    data = json.load(f)

bg = data["special"]["background"]
fg = data["special"]["foreground"]
colors = data["colors"]

# ==========================
# GENERATE ROOT
# ==========================

new_root = f"""
:root {{
    /* Background */
    --bg-primary: {hex_to_rgba(bg, 0.75)};
    --bg-secondary: {hex_to_rgba(bg, 0.75)};
    --bg-album-cover: {hex_to_rgba(colors["color2"], 0.85)};
    --bg-album-secondary: {hex_to_rgba(colors["color2"], 0.85)};
    
    /* Default Buttons */
    --btn-default: {hex_to_rgba(colors["color1"], 0.85)};
    --btn-default-secondary: {hex_to_rgba(colors["color1"], 0.85)};
    --btn-default-hover: {hex_to_rgba(colors["color5"], 0.92)};
    --btn-default-hover-secondary: {hex_to_rgba(colors["color5"], 0.92)};
    
    /* Play Button */
    --btn-play: {hex_to_rgba(colors["color4"], 0.95)};
    --btn-play-secondary: {hex_to_rgba(colors["color4"], 0.95)};
    --btn-play-hover: {hex_to_rgba(colors["color6"], 0.98)};
    --btn-play-hover-secondary: {hex_to_rgba(colors["color6"], 0.98)};
    --btn-play-active: {hex_to_rgba(colors["color9"], 0.95)};
    --btn-play-active-secondary: {hex_to_rgba(colors["color9"], 0.95)};
    
    /* Expand Button */
    --btn-expand: {hex_to_rgba(colors["color3"], 0.95)};
    --btn-expand-secondary: {hex_to_rgba(colors["color3"], 0.95)};
    --btn-expand-hover: {hex_to_rgba(colors["color13"], 0.98)};
    --btn-expand-hover-secondary: {hex_to_rgba(colors["color13"], 0.98)};
    --btn-expand-active: {hex_to_rgba(colors["color1"], 0.95)};
    --btn-expand-active-secondary: {hex_to_rgba(colors["color1"], 0.95)};
    
    /* Progress */
    --progress-bg: {hex_to_rgba(colors["color8"], 0.25)};
    --progress-fill-start: {hex_to_rgba(colors["color4"], 0.95)};
    --progress-fill-end: {hex_to_rgba(colors["color6"], 0.95)};
    
    /* Handle */
    --handle-color: {hex_to_rgba(colors["color4"], 0.98)};
    --handle-hover: {hex_to_rgba(colors["color6"], 1.0)};
    --handle-border: {hex_to_rgba(colors["color9"], 0.5)};
    --handle-shadow: {hex_to_rgba(colors["color4"], 0.6)};
    
    /* Text */
    --text-primary: {hex_to_rgba(fg, 0.95)};
    --text-secondary: {hex_to_rgba(colors["color15"], 0.85)};
    --text-tertiary: {hex_to_rgba(colors["color7"], 0.75)};
    --text-muted: {hex_to_rgba(colors["color8"], 0.65)};
    
    /* Borders */
    --border-primary: {hex_to_rgba(colors["color8"], 0.35)};
    --border-button: {hex_to_rgba(colors["color1"], 0.3)};
    --border-button-hover: {hex_to_rgba(colors["color5"], 0.45)};
    --border-play: {hex_to_rgba(colors["color4"], 0.4)};
    --border-play-hover: {hex_to_rgba(colors["color6"], 0.55)};
    --border-expand: {hex_to_rgba(colors["color3"], 0.4)};
    --border-expand-hover: {hex_to_rgba(colors["color13"], 0.55)};
    
    /* Shadows */
    --shadow-default: rgba(0,0,0,0.6);
    --shadow-button: rgba(0,0,0,0.5);
    --shadow-play: {hex_to_rgba(colors["color4"], 0.5)};
    --shadow-play-hover: {hex_to_rgba(colors["color6"], 0.7)};
    --shadow-expand: {hex_to_rgba(colors["color3"], 0.5)};
    --shadow-expand-hover: {hex_to_rgba(colors["color13"], 0.7)};
    --shadow-focus: {hex_to_rgba(colors["color4"], 0.7)};
    
    /* Sizes */
    --border-radius-container: 100px;
    --border-radius-section: 20px;
    --border-radius-album: 16px;
    --border-radius-button: 50%;
    --border-radius-progress: 2px;
    
    --padding-container: 12px;
    --padding-section: 16px;
}}
"""


# ==========================
# GENERATE VISUALIZER
# ==========================
new_visualizer = f"""
.visualizer-bar {{
    background: linear-gradient(180deg, 
        {hex_to_rgba(colors["color6"], 0.98)},
        {hex_to_rgba(colors["color4"], 0.98)},
        {hex_to_rgba(colors["color3"], 0.98)});
    border-radius: 0px;
    transition: all 0.05s ease-out;
    margin: 0px;
    min-width: 1px;
    min-height: 3px;
    box-shadow: 0 0 16px {hex_to_rgba(colors["color4"], 0.8)},
                0 0 10px {hex_to_rgba(colors["color3"], 0.6)};
}}
"""


# ==========================
# REPLACE CONTENT
# ==========================

css_content = style_path.read_text()

css_content = re.sub(
    r":root\s*\{[^}]*\}",
    new_root.strip(),
    css_content,
    flags=re.DOTALL,
)

css_content = re.sub(
    r"\.visualizer-bar\s*\{[^}]*\}",
    new_visualizer.strip(),
    css_content,
    flags=re.DOTALL,
)

style_path.write_text(css_content)

print("✅ CSS actualizado correctamente.")
