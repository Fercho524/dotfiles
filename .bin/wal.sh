#!/bin/sh 

function copy_config_files(){ 
   cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors.conf
   cp ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/themes/wal.rasi  
   #~/.bin/zathurawal/genzathurarc > ~/.config/zathura/zathurarc
}

function magic_appareance(){
   
   if [[ `echo $DESKTOP_SESSION` = "i3" ]]; then
      image=`cat ~/.config/nitrogen/bg-saved.cfg | head -n 2 | tail -n 1 | cut -d = -f 2` 
      wal -i $image -n -q -e     
      copy_config_files 
      i3 restart
   
   elif [[ `echo $DESKTOP_SESSION` = "bspwm" ]]; then
      image=`cat ~/.config/nitrogen/bg-saved.cfg | head -n 2 | tail -n 1 | cut -d = -f 2` 
      wal -i $image -n -e -q   
      copy_config_files 
      bspc wm -r
   
   elif [[ `echo $DESKTOP_SESSION` = "sway" ]]; then
      image=~/.wallpapers/main
      wal -i $image  -n -q -e -c     
      wal -i $image -q -e -n
      copy_config_files
   elif [[ `echo $DESKTOP_SESSION` = "gnome" ]]; then
      image=~/.config/background
      #rm -rf ~/.cache/wal
      wal -i $image  -n -q -e
      #copy_config_files
   fi

}

magic_appareance
