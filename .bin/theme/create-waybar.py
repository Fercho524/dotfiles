#!/usr/bin/env python3
"""
launch-waybar.py

Edita ~/.config/waybar/config (JSON) cambiando listas de módulos
y configuración de posición/márgenes de forma segura.

Uso resumido:
  # Reemplazar listas completas:
  launch-waybar.py --left "custom/launcher" "wlr/taskbar" \
                   --center "hyprland/workspaces" \
                   --right "custom/network" "pulseaudio"

  # Añadir o quitar un módulo:
  launch-waybar.py --add left custom/new-module
  launch-waybar.py --remove right custom/network

  # Cambiar posición y márgenes:
  launch-waybar.py --position top
  launch-waybar.py --margin 10

  # Dry-run (no escribe)
  launch-waybar.py --left A B --dry-run
"""
from __future__ import annotations
import argparse
import json
import os
import re
import shutil
import sys
from datetime import datetime
from typing import Any, Dict, List, Optional

CONFIG_PATH = os.path.expanduser("~/.config/waybar/config")
BACKUP_DIR = os.path.expanduser("~/.config/waybar/backups")

# Minimal default configuration used only if config file doesn't exist.
DEFAULT_CONFIG: Dict[str, Any] = {
    "layer": "bottom",
    "position": "bottom",
    "height": 44,
    "spacing": 0,
    "margin-top": 0,
    "margin-bottom": 5,
    "margin-right": 5,
    "margin-left": 5,
    "modules-left": [
        "custom/launcher",
        "wlr/taskbar"
    ],
    "modules-center": [
        "hyprland/workspaces"
    ],
    "modules-right": [
        "custom/network",
        "pulseaudio",
        "custom/cuda",
        "custom/vram",
        "custom/cpu",
        "memory",
        "disk",
        "tray",
        "clock"
    ]
}


# ----------------- Utilities -----------------
def strip_json_comments(text: str) -> str:
    """Remove /* ... */ and //... comments (best effort)."""
    # Remove block comments
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    # Remove line comments (//...) but try to avoid removing URLs
    lines = []
    for line in text.splitlines():
        idx = line.find("//")
        if idx != -1:
            # if it's part of a URL like http:// keep the line
            if re.search(r"https?://", line) and re.search(r"https?://").search(line) is not None:
                # crude: if http:// appears before //, keep
                m = re.search(r"https?://", line)
                if m and m.start() < idx:
                    lines.append(line)
                    continue
            line = line[:idx]
        lines.append(line)
    return "\n".join(lines)


def load_config(path: str) -> Dict[str, Any]:
    """Load config, strip comments if needed; return DEFAULT_CONFIG copy if missing."""
    if not os.path.exists(path):
        return DEFAULT_CONFIG.copy()
    with open(path, "r", encoding="utf-8") as f:
        raw = f.read()
    try:
        return json.loads(raw)
    except json.JSONDecodeError:
        stripped = strip_json_comments(raw)
        return json.loads(stripped)


def backup_config(path: str) -> None:
    if not os.path.exists(path):
        return
    os.makedirs(BACKUP_DIR, exist_ok=True)
    ts = datetime.now().strftime("%Y%m%d-%H%M%S")
    dest = os.path.join(BACKUP_DIR, f"{os.path.basename(path)}.bak-{ts}")
    shutil.copy2(path, dest)
    print(f"Backup creado: {dest}")


def write_config(path: str, data: Dict[str, Any]) -> None:
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
        f.write("\n")
    print(f"Configuración escrita en: {path}")


def ensure_list(value: Optional[List[str]]) -> List[str]:
    if value is None:
        return []
    if isinstance(value, list):
        return [str(v) for v in value]
    return [str(value)]


# ----------------- Operations -----------------
def set_position_modules(cfg: Dict[str, Any], pos: str, modules: List[str]) -> None:
    key = f"modules-{pos}"
    cfg[key] = modules


def add_module(cfg: Dict[str, Any], pos: str, module: str) -> None:
    key = f"modules-{pos}"
    lst = ensure_list(cfg.get(key))
    if module not in lst:
        lst.append(module)
    cfg[key] = lst


def remove_module(cfg: Dict[str, Any], pos: str, module: str) -> None:
    key = f"modules-{pos}"
    lst = ensure_list(cfg.get(key))
    cfg[key] = [m for m in lst if m != module]
    cfg[key] = lst


def set_position_and_margins(cfg: Dict[str, Any],
                             position: Optional[str],
                             margin_all: Optional[int]) -> None:
    """
    position: 'top' or 'bottom' or None
    margin_all: if not None, set same margin to all four sides (overrides position defaults)
    """
    if position:
        cfg["position"] = position

    # if margin_all is not None:
    #     # same margin for all sides
    #     cfg["margin-top"] = margin_all
    #     cfg["margin-bottom"] = margin_all
    #     cfg["margin-right"] = margin_all
    #     cfg["margin-left"] = margin_all
    #     return

    # if margin_all not set, apply sensible defaults for top/bottom if position is set
    margin = 5

    if margin_all is not None:
        margin = margin_all

    if position == "top":
        cfg["margin-top"] = margin
        cfg["margin-bottom"] = 0
        cfg["margin-right"] = margin
        cfg["margin-left"] = margin
    elif position == "bottom":
        cfg["margin-top"] = 0
        cfg["margin-bottom"] = margin
        cfg["margin-right"] = margin
        cfg["margin-left"] = margin
    # else: if position is None, do not change margins


# ----------------- CLI -----------------
def parse_args(argv: Optional[List[str]] = None):
    p = argparse.ArgumentParser(
        prog="launch-waybar",
        description="Genera/edita ~/.config/waybar/config estableciendo módulos y posición/márgenes"
    )
    p.add_argument("--left", nargs="*", metavar="MODULE", help="Lista completa para modules-left (reemplaza)")
    p.add_argument("--center", nargs="*", metavar="MODULE", help="Lista completa para modules-center (reemplaza)")
    p.add_argument("--right", nargs="*", metavar="MODULE", help="Lista completa para modules-right (reemplaza)")

    group = p.add_mutually_exclusive_group()
    group.add_argument("--add", nargs=2, metavar=("POSITION", "MODULE"),
                       help="Añade MODULE a POSITION (left|center|right)")
    group.add_argument("--remove", nargs=2, metavar=("POSITION", "MODULE"),
                       help="Quita MODULE de POSITION (left|center|right)")

    p.add_argument("--position", choices=["top", "bottom"], help="Establece posición de la barra (top/bottom)")
    p.add_argument("--margin", type=int, help="Un único valor para todos los márgenes (sobrescribe defaults)")

    p.add_argument("--dry-run", action="store_true", help="No escribe, imprime resultado en stdout")
    p.add_argument("--no-backup", action="store_true", help="No crear backup del config anterior")
    p.add_argument("--config", default=CONFIG_PATH, help="Ruta del config (por defecto ~/.config/waybar/config)")
    return p.parse_args(argv)


def validate_position(pos: str) -> str:
    p = pos.lower()
    if p not in ("left", "center", "right"):
        raise SystemExit(f"Posición inválida: {pos}. Usa left|center|right")
    return p


def main(argv: Optional[List[str]] = None):
    args = parse_args(argv)
    cfg_path = os.path.expanduser(args.config)

    cfg = load_config(cfg_path)

    # Apply module replacements
    if args.left is not None:
        set_position_modules(cfg, "left", list(args.left))
    if args.center is not None:
        set_position_modules(cfg, "center", list(args.center))
    if args.right is not None:
        set_position_modules(cfg, "right", list(args.right))

    # add/remove
    if args.add:
        pos = validate_position(args.add[0])
        mod = args.add[1]
        add_module(cfg, pos, mod)

    if args.remove:
        pos = validate_position(args.remove[0])
        mod = args.remove[1]
        remove_module(cfg, pos, mod)

    # Position and margins logic
    if args.margin is not None and args.margin < 0:
        raise SystemExit("margin debe ser >= 0")

    # Apply position/margins
    set_position_and_margins(cfg, args.position, args.margin)

    # Output
    if args.dry_run:
        json.dump(cfg, sys.stdout, ensure_ascii=False, indent=4)
        print()
        return

    if os.path.exists(cfg_path) and not args.no_backup:
        backup_config(cfg_path)

    write_config(cfg_path, cfg)
    print("Hecho. Puedes (re)iniciar waybar con: killall waybar || true; waybar &")


if __name__ == "__main__":
    main()
