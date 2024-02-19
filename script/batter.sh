#/bin/bash

dir="~/.config/dwm/script/temp"
eval dir=$dir
text_batter=$(acpi | awk 'BEGIN {FS=","} {print $2}' | awk '{$1=$1;print}' | sed 's/%//g') 
icon_batter=''
text_color="^c#BE98AA^^b#3E3F4C^"
icon_color="^c#E1DAD9^^b#4D3A59^"

get_icon(){
    text_changer=$(acpi -a | awk 'BEGIN {FS = ":"} {print $2}' | awk '{$1=$1;print $1}')
    if [ "$text_changer" = "on-line" ]; then
        icon_batter=''
    else 
       if [ $text_batter -eq 100 ]; then
           icon_batter=''
        elif [ $text_batter -gt 75 ] && [ $text_batter -lt 100 ];then
            icon_batter=''
        elif [ $text_batter -gt 50 ] && [ $text_batter -le 75 ];then
            icon_batter=''
        elif [ $text_batter -gt 25 ] && [ $text_batter -le 50 ];then
            icon_batter=''
        elif [ $text_batter -le 25 ];then
            icon_batter=''
       fi
    fi
}
init(){
    get_icon 
    sed -i '/^export _batter=.*$/d' $dir
    
    printf "export _batter='%s%s%s%s'\n" "$icon_color"" $icon_batter ""$text_color"" $text_batter% " >> $dir   
}

init
