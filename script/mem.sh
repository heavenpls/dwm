#!/bin/bash
dir='~/.config/dwm/script/temp'
eval dir=$dir
text_color="^c#C8EFED^^b#153c77^"
icon_color="^c#fbfbfb^^b#c21d03^"
icon_text="  "
init(){
    sed -i '/^export _mem=.*$/d' $dir
    mem_total=$(cat /proc/meminfo | grep MemTotal | awk '{printf "%.2fGB",$2/1024/1024}')
    mem_free=$(cat /proc/meminfo | grep MemFree | awk '{printf "%.2fGB",$2/1024/1024}')
    printf "export _mem='%s%s%s %s%s '\n" "$icon_color""$icon_text""$text_color" " $mem_free"/"$mem_total"  >> $dir
}
init
