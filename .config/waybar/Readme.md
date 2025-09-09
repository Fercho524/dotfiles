Dado el siguiente conjunto de variables en css : 

**wal.css**

```css
@define-color foreground #a5c2f0;
@define-color background #0d0c0d;
@define-color cursor #a5c2f0;

@define-color color0 #0d0c0d;
@define-color color1 #5B59A2;
@define-color color2 #615CB6;
@define-color color3 #9C4ED4;
@define-color color4 #07A7D4;
@define-color color5 #1398E0;
@define-color color6 #07B0F6;
@define-color color7 #a5c2f0;
@define-color color8 #7387a8;
@define-color color9 #5B59A2;
@define-color color10 #615CB6;
@define-color color11 #9C4ED4;
@define-color color12 #07A7D4;
@define-color color13 #1398E0;
@define-color color14 #07B0F6;
@define-color color15 #a5c2f0;
```

Y el siguiente archivo de estilos de waybar : 

**style.css**

```css
@import "../../.cache/wal/colors-waybar.css";

* {
  border: none;
  border-radius: 0px;
  font-family: Agave Nerd Font;
  font-size: 12px;
  font-weight: bold;
  min-height: 0;
}

window#waybar {
  background-color: #111316; /* Fondo principal OneDark */
  color: #abb2bf;
  transition-property: background-color;
  transition-duration: .5s;
}

window#waybar.hidden {
  opacity: 0.2;
}

#workspaces button {
  background: #202327; /* Botones en tonos neutros */
  color: #abb2bf;
}

#workspaces button:hover {
  background: #61afef; /* Azul para hover */
  color: #282c34;
  border-bottom: 3px solid #282c34;
}

#workspaces button.focused {
  background: #98c379; /* Verde cálido */
}

#workspaces button.focused:hover {
  background: #61afef;
  color: #282c34;
  border-bottom: 3px solid #282c34;
}

#workspaces button.urgent {
  background-color: #e06c75; /* Rojo cálido */
}

#mode {
  background-color: #c678dd; /* Púrpura */
  border-bottom: 3px solid #282c34;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#custom-media,
#custom-launcher,
#custom-power,
#custom-layout,
#custom-updater,
#custom-snip,
#taskbar,
#tray,
#mode,
#idle_inhibitor,
#custom-cuda,
#custom-vram,
#custom-cpu,
#custom-memory,
#custom-network,
#mpd {
  margin-top: 5px;
  margin-bottom: 5px;
  padding: 2px 10px;
  margin-right: 4px;
  margin-left: 4px;
  border-radius: 10px;
  color: #abb2bf;
}

#window,
#workspaces {
  margin: 0px 4px;
}

.modules-left > widget:first-child > #workspaces {
  margin-left: 0px;
}

.modules-right > widget:last-child > #workspaces {
  margin-right: 0px;
}

#clock {
  background-color: transparent;
  color: white;
  font-size: xx-large;
  margin-right: 4px;
}

#battery {
  background-color: #3e4451;
  color: #abb2bf;
}

#battery.charging, #battery.plugged {
  background-color: #98c379;
}



@keyframes blink {
  to {
      background-color: #e06c75;
      color: #abb2bf;
  }
}

#battery.critical:not(.charging) {
  background-color: #e06c75;
  color: #abb2bf;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

label:focus {
  background-color: #3e4451;
}

#cpu, #memory, #disk, #network, #pulseaudio {
  background-color: #89c1c9;
  color: #282c34;
}

#custom-media,#custom-updater {
  background-color: #61afef;
  color: #282c34;
  margin-right: 5px;
  margin-left: 5px;
}

#custom-power {
  background-color: #d19a66;
  font-size: 18px;
  margin-left: 2px;
}

#custom-layout {
  background-color: #c678dd;
  color: #282c34;
  font-size: 18px;
}

#custom-cpu 
{
  background-color: #624aca;
  color: #fcfdff;
}

#custom-memory {
  background-color: #95aef5;
  color: #202327;
}

#custom-network {
  background-color: #7cc5f0;
  color: #ffffff;
}

#custom-cuda {
  background-color: #8f82ff;
  color: #202327;
}

#custom-vram {
  background-color: #aa8ff5;
  color: #202327;
}

#custom-launcher {
  background-color: #4fbfff;
  color: #ffffff;
  font-size: x-large;
}

#taskbar {
  background-color: #493b68;
}

#temperature {
  background-color: #d19a66;
  color: #282c34;
}

#temperature.critical {
  background-color: #e06c75;
}

#tray {
  background-color: #423e50;
  color: #282c34;
  border-radius: 30px;
}

#tray > .passive {
  -gtk-icon-effect: dim;
  background-color: #56b6c2;
  color: #282c34;
}

#tray > .needs-attention {
  -gtk-icon-effect: highlight;
  background-color: #e06c75;
  color: #282c34;
}

#idle_inhibitor {
  background-color: #c678dd;
}

#idle_inhibitor.activated {
  background-color: #98c379;
  color: #282c34;
}

#language {
  background-color: #61afef;
  color: #282c34;
  min-width: 16px;
  padding-left: 8px;
}

#keyboard-state {
  background: #98c379;
  color: #282c34;
  min-width: 16px;
}

#keyboard-state > label {
  padding: 0px 5px;
}

#keyboard-state > label.locked {
  background: rgba(255, 255, 255, 0.2);
}
```

El orden de los módulos en waybar es el siguiente:

```json
    "modules-left": [
        "custom/launcher",
        "wlr/taskbar"
    ],
    "modules-center": [
        "custom/media"
    ],
    "modules-right": [
        "pulseaudio",
        "custom/cpu",
        "custom/memory",
        "custom/cuda",
        "custom/vram",
        "custom/updater",
        "custom/network",
        "tray",
        "clock"
    ]
```

Debes reemplazar los atributos background-color y background por las variables de los colores de wal, es decir, que utilizarás una sintaxis como esta : 

```css
background-color : @color4;
```

Realiza esto con todos los componentes en el archivo style.css acorde al orden de los módulos en waybar.