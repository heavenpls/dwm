#!/bin/bash
dir="~/.config/dwm/script/temp"
eval dir=$dir
icon_color="^c#D1EDE4^^b#543b680x88^"
text_color="^c#DCDFEC^^b#3335700x88^"
text_date=$(date +" %Y-%m-%d %H:%M ")
text_icon="  "
text_hour=$(date +"%I")
init(){
        
    sed -i '/^export _date=.*$/d' $dir
    printf "export _date='%s%s%s%s'\n" "$icon_color""$text_icon""$text_color""$text_date" >> $dir   
}
init
