#!/bin/bash

function writeTheme() {

    theme=$1
    theme_file="$HOME/.config/i3/themes/$theme.json"

    if [[ theme="wal" ]]; then
        source ~/.config/i3/themes/wal.sh
        text=$foreground
    else
        color1=$(cat $theme_file | grep -A 1 "color1" | cut -d '"' -f 2 | grep '#')
        color2=$(cat $theme_file | grep -A 1 "color2" | cut -d '"' -f 2 | grep '#')
        color3=$(cat $theme_file | grep -A 1 "color3" | cut -d '"' -f 2 | grep '#')
        color4=$(cat $theme_file | grep -A 1 "color4" | cut -d '"' -f 2 | grep '#')
        text=$(cat $theme_file | grep -A 1 "text" | cut -d '"' -f 2 | grep '#')
    fi

    echo "
command=/usr/lib/i3blocks/$BLOCK_NAME
markup=pango
full_text= 
align=center
color=#666666
separator=false
separator_block_width=0
border_bottom=0
border_top=0

[separator]
background=#282c3409
color=$color1 
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2

[Volume]
command=pamixer --get-volume-human 
interval=1
label= Vol  
color=#000000
background=$color1 
full_text=
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2

[separator]
background=$color1 
color=$color2 
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2

[Root]
command=echo $(bash ~/.config/i3/scripts/rootstorage.sh) G
interval=3
label=System 
color=#000000
background=$color2 
full_text=
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2

[separator]
background=$color2 
color=$color3 
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2

[Global]
command=echo $(bash ~/.config/i3/scripts/sharedstorage.sh) G
interval=1
label=Shared  
color=#000000
background=$color3 
full_text=
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2

[separator]
background=$color3 
color=$color4 
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2

[Date]
command=date '+%d de %B de %Y'
interval=5
label=  
color=#000000
background=$color4 
full_text=
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2

[separator]
color=$color1 
background=$color4 
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2

[Time]
command=date '+%I:%M'
interval=1
label=  
color=#000000
background=$color1 
full_text=
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2

[separator]
color=#282c3400
background=$color1 
border=#282c3409
border_left=0
border_right=0
border_top=2
border_bottom=2
" >~/.config/i3/bars/main.conf
}

function main() {
    if [[ $1 == "-l" ]]; then
        ls ~/.config/i3/themes
    else
        cd ~/.config/i3
        writeTheme $1
        i3 restart 2>/dev/null
        clear
    fi
}

main $1
