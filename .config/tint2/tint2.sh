#!/bin/bash

source $HOME/.cache/wal/colors.sh

function vertical() {
    echo "#---- Generated by tint2conf 960b ----
# See https://gitlab.com/o9000/tint2/wikis/Configure for
# full documentation of the configuration options.

#-------------------------------------
# MAIN BUTTON
gradient = horizontal
start_color = $color1 100
end_color = $color1 100
gradient = vertical
start_color = $color1 82
end_color = $color1 82

#-------------------------------------
# Background 3 ACTIVE TASK
rounded = 10
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = $foreground 100
border_color = $foreground 0
background_color_hover = $foreground 78
border_color_hover = $foreground 78
background_color_pressed = $foreground 100
border_color_pressed = $foreground 100

#-------------------------------------
# Background 3: DEFAULT TASK
rounded = 8
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = $color1 100
border_color = $color1 100
gradient_id = 0
background_color_hover = $foreground 82
border_color_hover = $foreground 82
background_color_pressed = $color1 100
border_color_pressed = $color1 100

#-------------------------------------
# Background 3: Active desktop name, Inactive desktop name, Urgent task
rounded = 8
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #f9f9f9 100
border_color = #f9f9f9 40
gradient_id = 0
background_color_hover = #f9f9f9 88
border_color_hover = #f9f9f9 40
background_color_pressed = #f9f9f9 100
border_color_pressed = #f9f9f9 78

#-------------------------------------
# Background 4: Active taskbar, Clock, Inactive taskbar, Panel
rounded = 8
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #0a0a0a 80
border_color = #000000 0
background_color_hover = #000000 0
border_color_hover = #000000 0
background_color_pressed = #000000 0
border_color_pressed = #000000 0

#-------------------------------------
# Background 5:
rounded = 6
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #f9f9f9 0
border_color = #a1a8b9 0
gradient_id = 1
background_color_hover = #63c5ea 0
border_color_hover = #a1a8b9 0
gradient_id_hover = 2
background_color_pressed = #63c5ea 0
border_color_pressed = #a1a8b9 0
gradient_id_pressed = 1

#-------------------------------------
# Background 6: Button, Executor
rounded = 0
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = $background 80
border_color = $background 100
gradient_id = 0
background_color_hover = $background 100
border_color_hover = $background 100
background_color_pressed = $background 100
border_color_pressed = $background 100
gradient_id_pressed = 0

#-------------------------------------
# Background 7: Tooltip
rounded = 0
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #0a0a0a 0
border_color = #000000 0
background_color_hover = #000000 0
border_color_hover = #000000 0
background_color_pressed = #000000 0
border_color_pressed = #000000 0

#-------------------------------------
# Background 8: Systray
rounded = 15
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = $color3 100
border_color = #a1a8b9 0
background_color_hover = $color3 100
border_color_hover = #a1a8b9 0
background_color_pressed = $color3 100
border_color_pressed = #a1a8b9 0

#-------------------------------------
# Panel
panel_items = PPTPEPPPPPP:S:C
panel_size = 100% 45
panel_margin = 0 0
panel_padding = 7 7 7
panel_background_id = 6
wm_menu = 0
panel_dock = 0
panel_pivot_struts = 0
panel_position = left left vertical
panel_layer = bottom
panel_monitor = all
panel_shrink = 0
autohide = 0
autohide_show_timeout = 0
autohide_hide_timeout = 0
autohide_height = 1
strut_policy = follow_size
panel_window_name = mech.tint2
disable_transparency = 1
mouse_effects = 1
font_shadow = 0
mouse_hover_icon_asb = 100 0 10
mouse_pressed_icon_asb = 100 0 0
scale_relative_to_dpi = 0
scale_relative_to_screen_height = 0

#-------------------------------------
# Taskbar
taskbar_mode = single_desktop
taskbar_hide_if_empty = 0
taskbar_padding = 7 0 7
taskbar_background_id = 7
taskbar_active_background_id = 7
task_icon = 1
task_text = 0
taskbar_name = 1
taskbar_hide_inactive_tasks = 0
taskbar_hide_different_monitor = 0
taskbar_hide_different_desktop = 0
taskbar_always_show_all_desktop_tasks = 1
taskbar_name_padding = 6 0
taskbar_name_background_id = 7
taskbar_name_active_background_id = 4
taskbar_name_font = Iosevka 17
taskbar_name_font_color = #f9f9f9 100
taskbar_name_active_font_color = #f9f9f9 100
taskbar_distribute_size = 0
taskbar_sort_order = none
task_align = left

#-------------------------------------
# Task
task_text = 0
task_icon = 1
task_centered = 1
urgent_nb_of_blink = 3
task_maximum_size = 35 35
task_padding = 4 4 4
task_font = Sans 0
task_tooltip = 1
task_thumbnail = 1
task_thumbnail_size = 210
task_background_id = 5
task_active_background_id = 5
task_urgent_background_id = 5
mouse_left = toggle_iconify
mouse_middle = none
mouse_right = close
mouse_scroll_up = next_task
mouse_scroll_down = prev_task

#-------------------------------------
# System tray (notification area)
systray_padding = 8 0 10
systray_background_id = 8
systray_sort = ascending
systray_icon_size = 16
systray_icon_asb = 100 0 10
systray_monitor = 1
systray_name_filter =

#-------------------------------------
# Clock
time1_format = %H %M
time2_format =
time1_font = Iosevka Bold 12
time1_timezone =
time2_timezone =
time2_font = Iosevka Bold 7
clock_font_color = #f9f9f9 100
clock_padding = 7 0
clock_background_id = 7
clock_tooltip = %A %B %d, %Y
clock_tooltip_timezone =
clock_lclick_command = gsimplecal
clock_rclick_command = gsimplecal
clock_mclick_command =
clock_uwheel_command =
clock_dwheel_command =

#-------------------------------------
# Separator 1
separator = new
separator_background_id = 0
separator_color = #3b4252 0
separator_style = empty
separator_size = 0
separator_padding = 1 0

#-------------------------------------
# WINDOW, RUN, DRUN LAUNCHER
button = new
button_text = 
button_tooltip = Open App Launcher
button_lclick_command = ~/.config/rofi/launcher.sh
button_rclick_command =
button_mclick_command =
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = $foreground 100
button_padding = 0 0 0 0
button_background_id = 5
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# TASKS
button = new
button_text = 
button_tooltip = Switch Between Opened Windows
button_lclick_command = ~/.config/rofi/window.sh
button_rclick_command =
button_mclick_command =
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 0 0
button_background_id = 5
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# WALLPAPER TOOL
button = new
button_text = 
button_tooltip = Change current wallpaper │ Generate wallpaper
button_lclick_command = nitrogen
button_rclick_command = ~/.bin/wal.sh
button_mclick_command =
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 0 0
button_background_id = 4
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# TERMINAL LAUNCHER
button = new
button_text = 
button_tooltip = Open the terminal
button_lclick_command = kitty
button_rclick_command = alacritty
button_mclick_command = xterm
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 0 0
button_background_id = 4
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# POWERMENU
button = new
button_text = 
button_tooltip = Power Menu
button_lclick_command = ~/.config/rofi/powermenu.sh
button_rclick_command =
button_mclick_command =
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 0 0
button_background_id = 4
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# EMOJI CLIPBOARD
button = new
button_text =
button_tooltip = Open emoji clipboard selector
button_lclick_command = rofi -show emoji -modi emoji -theme ~/.config/rofi/applets/emoji.rasi
button_rclick_command = rofi -show emoji -modi emoji -theme ~/.config/rofi/applets/emoji.rasi
button_mclick_command = rofi -show emoji -modi emoji -theme ~/.config/rofi/applets/emoji.rasi
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 0 0
button_background_id = 4
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# APPS
button = new
button_text =
button_tooltip = Open your favorite apps
button_lclick_command = ~/.config/rofi/apps.sh
button_rclick_command = ~/.config/rofi/quicklinks.sh
button_mclick_command =
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 0 0
button_background_id = 4
button_centered = 1
button_max_icon_size = 0


-------------------------------------
# Tooltip
tooltip_show_timeout = 0.5
tooltip_hide_timeout = 0.2
tooltip_padding = 8 6
tooltip_background_id = 7
tooltip_font_color = #f9f9f9 100
tooltip_font = Cantarell 9
    " >~/.config/tint2/config
    tint2 -c ~/.config/tint2/config
}



function horizontal() {
    echo "#---- Generated by tint2conf 960b ----
# See https://gitlab.com/o9000/tint2/wikis/Configure for
# full documentation of the configuration options.

#-------------------------------------
# MAIN BUTTON
gradient = horizontal
start_color = $color1 100
end_color = $color1 100
gradient = vertical
start_color = $color1 82
end_color = $color1 82

#-------------------------------------
# ACTIVE TASK
rounded = 10
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = $foreground 100
border_color = $foreground 0
background_color_hover = $foreground 78
border_color_hover = $foreground 78
background_color_pressed = $foreground 100
border_color_pressed = $foreground 100

# DEFAULT TASK
rounded = 8
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = $color1 100
border_color = $color1 100
gradient_id = 0
background_color_hover = $foreground 82
border_color_hover = $foreground 82
background_color_pressed = $color1 100
border_color_pressed = $color1 100

# Background 3: Active desktop name, Inactive desktop name, Urgent task
rounded = 8
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #f9f9f9 100
border_color = #f9f9f9 40
gradient_id = 0
background_color_hover = #f9f9f9 88
border_color_hover = #f9f9f9 40
background_color_pressed = #f9f9f9 100
border_color_pressed = #f9f9f9 78

# Background 4: Active taskbar, Clock, Inactive taskbar, Panel
rounded = 8
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #0a0a0a 80
border_color = #000000 0
background_color_hover = #000000 0
border_color_hover = #000000 0
background_color_pressed = #000000 0
border_color_pressed = #000000 0

# Background 5:
rounded = 6
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #f9f9f9 0
border_color = #a1a8b9 0
gradient_id = 1
background_color_hover = #63c5ea 0
border_color_hover = #a1a8b9 0
gradient_id_hover = 2
background_color_pressed = #63c5ea 0
border_color_pressed = #a1a8b9 0
gradient_id_pressed = 1

# Background 6: Button, Executor
rounded = 0
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = $background 80
border_color = $background 100
gradient_id = 0
background_color_hover = $background 100
border_color_hover = $background 100
background_color_pressed = $background 100
border_color_pressed = $background 100
gradient_id_pressed = 0

# Background 7: Tooltip
rounded = 0
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #0a0a0a 0
border_color = #000000 0
background_color_hover = #000000 0
border_color_hover = #000000 0
background_color_pressed = #000000 0
border_color_pressed = #000000 0

# Background 8: Systray
rounded = 15
border_width = 0
border_sides =
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = $color1 100
border_color = #a1a8b9 0
background_color_hover = $color1 100
border_color_hover = #a1a8b9 0
background_color_pressed = $color1 100
border_color_pressed = #a1a8b9 0

#-------------------------------------
# Panel
panel_items = PPTPEPPPPPP:S:C
panel_size = 100% 45
panel_margin = 0 0
panel_padding = 7 7 7
panel_background_id = 6
wm_menu = 0
panel_dock = 0
panel_pivot_struts = 0
panel_position = bottom center horizontal
panel_layer = bottom
panel_monitor = all
panel_shrink = 0
autohide = 0
autohide_show_timeout = 0
autohide_hide_timeout = 0
autohide_height = 1
strut_policy = follow_size
panel_window_name = mech.tint2
disable_transparency = 1
mouse_effects = 1
font_shadow = 0
mouse_hover_icon_asb = 100 0 10
mouse_pressed_icon_asb = 100 0 0
scale_relative_to_dpi = 0
scale_relative_to_screen_height = 0

#-------------------------------------
# Taskbar
taskbar_mode = single_desktop
taskbar_hide_if_empty = 0
taskbar_padding = 7 0 7
taskbar_background_id = 7
taskbar_active_background_id = 7
task_icon = 1
task_text = 0
taskbar_name = 1
taskbar_hide_inactive_tasks = 0
taskbar_hide_different_monitor = 0
taskbar_hide_different_desktop = 0
taskbar_always_show_all_desktop_tasks = 1
taskbar_name_padding = 8 2
taskbar_name_background_id = 4
taskbar_name_active_background_id = 4
taskbar_name_font = Iosevka 20
taskbar_name_font_color = #f9f9f9 100
taskbar_name_active_font_color = #f9f9f9 100
taskbar_distribute_size = 0
taskbar_sort_order = none
task_align = left

#-------------------------------------
# Task
task_text = 0
task_icon = 1
task_centered = 1
urgent_nb_of_blink = 3
task_maximum_size = 35 35
task_padding = 4 4 4
task_font = Sans 0
task_tooltip = 1
task_thumbnail = 1
task_thumbnail_size = 210
task_background_id = 7
task_active_background_id = 4
task_urgent_background_id = 5
mouse_left = toggle_iconify
mouse_middle = none
mouse_right = close
mouse_scroll_up = next_task
mouse_scroll_down = prev_task

#-------------------------------------
# System tray (notification area)
systray_padding = 8 0 10
systray_background_id = 8
systray_sort = ascending
systray_icon_size = 16
systray_icon_asb = 100 0 10
systray_monitor = 1
systray_name_filter =

#-------------------------------------
# Clock
time1_format = %H:%M
time2_format =
time1_font = Iosevka Bold 15
time1_timezone =
time2_timezone =
time2_font = Iosevka Bold 7
clock_font_color = #f9f9f9 100
clock_padding = 7 0
clock_background_id = 7
clock_tooltip = %A %B %d, %Y
clock_tooltip_timezone =
clock_lclick_command = gsimplecal
clock_rclick_command = gsimplecal
clock_mclick_command =
clock_uwheel_command =
clock_dwheel_command =

#-------------------------------------
# Separator 1
separator = new
separator_background_id = 0
separator_color = #3b4252 0
separator_style = empty
separator_size = 0
separator_padding = 1 0

#-------------------------------------
# WINDOW, RUN, DRUN LAUNCHER
button = new
button_text = 
button_tooltip = Click to open app launcher
button_lclick_command = ~/.config/rofi/launcher.sh
button_rclick_command = ~/.config/rofi/run.sh
button_mclick_command = ~/.config/rofi/window.sh
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 8
button_background_id = 5
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# TASKS
button = new
button_text = 
button_tooltip = Open your favorite apps
button_lclick_command = ~/.config/rofi/window.sh
button_rclick_command =
button_mclick_command =
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 8 0
button_background_id = 5
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# WALLPAPER TOOL
button = new
button_text = 
button_tooltip = Change current wallpaper │ Generate wallpaper
button_lclick_command = nitrogen
button_rclick_command = nitrogen
button_mclick_command =
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 8 0
button_background_id = 4
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# TERMINAL LAUNCHER
button = new
button_text = 
button_tooltip = Open the terminal
button_lclick_command = kitty
button_rclick_command = alacritty
button_mclick_command = xterm
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 8 0
button_background_id = 4
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# POWERMENU
button = new
button_text = 
button_tooltip = Power Menu
button_lclick_command = ~/.config/rofi/powermenu.sh
button_rclick_command =
button_mclick_command =
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 8 0
button_background_id = 4
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# EMOJI CLIPBOARD
button = new
button_text =
button_tooltip = Open emoji clipboard selector
button_lclick_command = rofi -show emoji -modi emoji -theme ~/.config/rofi/applets/emoji.rasi
button_rclick_command = rofi -show emoji -modi emoji -theme ~/.config/rofi/applets/emoji.rasi
button_mclick_command = rofi -show emoji -modi emoji -theme ~/.config/rofi/applets/emoji.rasi
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 8 0
button_background_id = 4
button_centered = 1
button_max_icon_size = 0

#-------------------------------------
# APPS
button = new
button_text =
button_tooltip = Open your favorite apps
button_lclick_command = ~/.config/rofi/apps.sh
button_rclick_command = ~/.config/rofi/quicklinks.sh
button_mclick_command =
button_uwheel_command =
button_dwheel_command =
button_font = SpaceMono NF 20
button_font_color = #f9f9f9 100
button_padding = 8 0
button_background_id = 4
button_centered = 1
button_max_icon_size = 0


-------------------------------------
# Tooltip
tooltip_show_timeout = 0.5
tooltip_hide_timeout = 0.2
tooltip_padding = 8 6
tooltip_background_id = 7
tooltip_font_color = #f9f9f9 100
tooltip_font = Cantarell 9

    " >~/.config/tint2/config
    tint2 -c ~/.config/tint2/config
}

function powerLine(){
    
    echo "
#-------------------------------------
# Backgrounds
#-------------------------------------

# Background 1: Executor, Panel, Systray
rounded = 0
border_width = 0
border_sides = TBLR
background_color = #2f343f 100
border_color = #484848 0
background_color_hover = #2f343f 100
border_color_hover = #484848 100
background_color_pressed = #2f343f 100
border_color_pressed = #484848 100

# Background 2: Active desktop name, Clock, Launcher, Tooltip
rounded = 0
border_width = 0
border_sides = TBLR
background_color = #5294e2 100
border_color = #000000 100
background_color_hover = #5294e2 100
border_color_hover = #000000 100
background_color_pressed = #5294e2 100
border_color_pressed = #000000 100

# Background 3: Active task
rounded = 0
border_width = 0
border_sides = B
background_color = #2f343f 100
border_color = #5294e2 100
background_color_hover = #2f343f 100
border_color_hover = #5294e2 100
background_color_pressed = #2f343f 100
border_color_pressed = #5294e2 100

#-------------------------------------
# Panel
panel_items = ELEEEEETFECEEEES
panel_size = 100% 26
panel_margin = 0 0
panel_padding = 0 0 0
panel_background_id = 1
wm_menu = 1
panel_dock = 0
panel_position = top center horizontal
panel_layer = bottom
panel_monitor = all
panel_shrink = 0
autohide = 0
autohide_show_timeout = 0.2
autohide_hide_timeout = 1
autohide_height = 1
strut_policy = follow_size
panel_window_name = tint2
disable_transparency = 0
mouse_effects = 0
font_shadow = 0
mouse_hover_icon_asb = 100 0 10
mouse_pressed_icon_asb = 100 0 0

#-------------------------------------
# Taskbar
taskbar_mode = single_desktop
taskbar_hide_if_empty = 0
taskbar_padding = 5 0 0
taskbar_background_id = 0
taskbar_active_background_id = 0
taskbar_name = 0
taskbar_hide_inactive_tasks = 1
taskbar_hide_different_monitor = 0
taskbar_hide_different_desktop = 0
taskbar_always_show_all_desktop_tasks = 0
taskbar_name_padding = 15 3
taskbar_name_background_id = 0
taskbar_name_active_background_id = 2
taskbar_name_font = mPlus Nerd Font Bold 10
taskbar_name_font_color = #000000 100
taskbar_name_active_font_color = #2f343f 100
taskbar_distribute_size = 0
taskbar_sort_order = none
task_align = center

#-------------------------------------
# Task
task_text = 1
task_icon = 0
task_centered = 1
urgent_nb_of_blink = 20
task_maximum_size = 270 22
task_padding = 2 4 10
task_font = mPlus Nerd Font 9
task_tooltip = 1
task_font_color = #5294e2 100
task_active_font_color = #5294e2 100
task_urgent_font_color = #ffffff 100
task_iconified_font_color = #e7e8eb 100
task_icon_asb = 95 0 0
task_active_icon_asb = 100 0 0
task_urgent_icon_asb = 100 0 0
task_iconified_icon_asb = 100 0 0
task_background_id = 0
task_active_background_id = 3
task_urgent_background_id = 0
task_iconified_background_id = 0
mouse_left = toggle_iconify
mouse_middle = none
mouse_right = none
mouse_scroll_up = toggle
mouse_scroll_down = iconify

#-------------------------------------
# System tray (notification area)
systray_padding = 5 0 5
systray_background_id = 1
systray_sort = left2right
systray_icon_size = 20
systray_icon_asb = 100 0 0
systray_monitor = 1
systray_name_filter = 

#-------------------------------------
# Launcher
launcher_padding = 10 0 15
launcher_background_id = 2
launcher_icon_background_id = 0
launcher_icon_size = 20
launcher_icon_asb = 100 0 0
launcher_icon_theme = Papirus-Dark
launcher_icon_theme_override = 1
startup_notifications = 0
launcher_tooltip = 1
launcher_item_app = ~/.local/share/applications/prev.desktop
launcher_item_app = ~/.local/share/applications/stop.desktop
launcher_item_app = ~/.local/share/applications/play-pause.desktop
launcher_item_app = ~/.local/share/applications/next.desktop

#-------------------------------------
# Clock
time1_format =  %H:%M  %b %d
time2_format = 
time1_font = SpaceMono NF 9
time1_timezone = 
time2_timezone = 
clock_font_color = #ffffff 100
clock_padding = 5 4
clock_background_id = 2
clock_tooltip = 
clock_tooltip_timezone = 
clock_lclick_command = orage
clock_rclick_command = 
clock_mclick_command = 
clock_uwheel_command = 
clock_dwheel_command = 

#-------------------------------------
# Battery
battery_tooltip = 1
battery_low_status = 20
battery_low_cmd = notify-send "battery low"
battery_full_cmd = 
bat1_font = mplus Nerd Font 11
bat2_font = mPlus Nerd Font, 6
battery_font_color = #b5b5b5 100
bat1_format = 
bat2_format = 
battery_padding = 5 0
battery_background_id = 0
battery_hide = 101
battery_lclick_command = 
battery_rclick_command = 
battery_mclick_command = 
battery_uwheel_command = 
battery_dwheel_command = 
ac_connected_cmd = 
ac_disconnected_cmd = 

#-------------------------------------
# Executor 1
execp = new
execp_command = echo ""
execp_interval = 0
execp_has_icon = 0
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_tooltip = Menu
execp_lclick_command = ~/.config/rofi/launcher.sh
execp_font = SpaceMono NF 12
execp_font_color = #2f343f 100
execp_padding = 10 0
execp_background_id = 2
execp_centered = 0
execp_icon_w = 0
execp_icon_h = 0

#-------------------------------------
# Executor 2
execp = new
execp_command = echo ""
execp_interval = 0
execp_has_icon = 0
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_font = SpaceMono NF 20
execp_font_color = #5294e2 100
execp_padding = 0 0
execp_background_id = 1
execp_centered = 0
execp_icon_w = 0
execp_icon_h = 0

#-------------------------------------
# Executor 3
execp = new
execp_command =  echo ""  `checkupdates | wc -l`
execp_interval = 1
execp_has_icon = 0
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_tooltip = Updates 
execp_font = SpaceMono NF 9
execp_font_color = #e7e8eb 100
execp_padding = 10 0
execp_background_id = 1
execp_centered = 0
execp_icon_w = 0
execp_icon_h = 0

#-------------------------------------
# Executor 4
execp = new
execp_command = echo ""
execp_interval = 0
execp_has_icon = 0
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_tooltip = 
execp_lclick_command = 
execp_rclick_command = 
execp_mclick_command = 
execp_uwheel_command = 
execp_dwheel_command = 
execp_font = SpaceMono NF 20
execp_font_color = #2f343f 100
execp_padding = 0 0
execp_background_id = 2
execp_centered = 0
execp_icon_w = 0
execp_icon_h = 0

#-------------------------------------
# Executor 5
execp = new
execp_command = echo " " "$XDG_SESSION_DESKTOP"
execp_interval = 1
execp_has_icon = 0
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_tooltip = 
execp_font = SpaceMono NF 10
execp_font_color = #2f343f 100
execp_padding = 5 0
execp_background_id = 2
execp_centered = 0
execp_icon_w = 0
execp_icon_h = 0

#-------------------------------------
# Executor 6
execp = new
execp_command = echo ""
execp_interval = 0
execp_has_icon = 0
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_tooltip = 
execp_lclick_command = 
execp_rclick_command = 
execp_mclick_command = 
execp_uwheel_command = 
execp_dwheel_command = 
execp_font = SpaceMono NF 20
execp_font_color = #5294e2 100
execp_padding = 0 0
execp_background_id = 1
execp_centered = 0
execp_icon_w = 0
execp_icon_h = 0

#-------------------------------------
# Executor 7
execp = new
execp_command = echo ""
execp_interval = 0
execp_has_icon = 0
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_lclick_command = 
execp_rclick_command = 
execp_mclick_command = 
execp_uwheel_command = 
execp_dwheel_command = 
execp_font = SpaceMono NF 12
execp_font_color = #5294e2 100
execp_padding = 0 0
execp_background_id = 1
execp_centered = 0
execp_icon_w = 0
execp_icon_h = 0

#-------------------------------------
# Executor 7
execp = new
execp_command = echo ""
execp_interval = 0
execp_has_icon = 0
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_lclick_command = 
execp_rclick_command = 
execp_mclick_command = 
execp_uwheel_command = 
execp_dwheel_command = 
execp_font = SpaceMono NF 12
execp_font_color = #2f343f 100
execp_padding = 0 0
execp_background_id = 2
execp_centered = 0
execp_icon_w = 0
execp_icon_h = 0


#-------------------------------------
# Executor 10
execp = new
execp_command = ~/.config/tint2/scripts/battery icon
execp_interval = 20
execp_has_icon = 1
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_tooltip = 
execp_lclick_command = 
execp_rclick_command = 
execp_mclick_command = 
execp_uwheel_command = 
execp_dwheel_command = 
execp_font_color = #000000 100
execp_padding = 0 0
execp_background_id = 1
execp_centered = 0
execp_icon_w = 0
execp_icon_h = 0

#-------------------------------------
# Executor 11
execp = new
execp_command = ~/.config/tint2/scripts/battery perc
execp_interval = 15
execp_has_icon = 0
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_tooltip = 
execp_lclick_command = 
execp_rclick_command = 
execp_mclick_command = 
execp_uwheel_command = 
execp_dwheel_command = 
execp_font = mplus Nerd Font 9
execp_font_color = #5294e2 100
execp_padding = 0 0
execp_background_id = 1
execp_centered = 0
execp_icon_w = 0
execp_icon_h = 0

#-------------------------------------
# Tooltip
tooltip_show_timeout = 0
tooltip_hide_timeout = 0
tooltip_padding = 2 2
tooltip_background_id = 2
tooltip_font_color = #ffffff 100
tooltip_font = mPlus Nerd Font 9
    " >~/.config/tint2/config
    tint2 -c ~/.config/tint2/config
}

# Running TINT2 for BSPWM or I3WM

if [[ $DESKTOP_SESSION = "openbox" || $DESKTOP_SESSION = "bspwm" ]]; then
    if [[ $1 = "vertical" ]]; then
        killall -q tint2
        bspc config bottom_padding 0
        vertical
        #bspc config left_padding 0
        elif [[ $1 = "horizontal" ]]; then
        killall -q tint2
        bspc config left_padding 0
        horizontal
        #bspc config bottom_padding 0
    fi
fi

if [[ $DESKTOP_SESSION = "i3" ]]; then
    killall -q tint2
    horizontal
fi