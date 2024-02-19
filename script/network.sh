#!/bin/bash
dir="~/.config/dwm/script/temp"
eval dir=$dir
inteface='wlan0'
text_network=''
text_color="^c#BE98AA^^b#3E3F4C^"
icon_text=''
icon_color="^c#E1DAD9^^b#4D3A59^"
init(){
    sed -i '/^export _network=.*$/d' $dir
    text_network=$(iftop -t -s 1 -n -N -i $inteface | grep -A 1 "Total send rate:" | awk '{print $5}' | awk '{printf "%s%s",$0,(NR==NF ? "/":"\n")}')
    printf "export _network='%s%s%s%s'\n" "$icon_color"" $icon_text ""$text_color"" $text_network " >> $dir   
}
init
