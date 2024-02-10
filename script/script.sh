#!/bin/bash
dir='~/.config/dwm/script/temp'
eval dir=$dir
i=0
while true; do
    echo>$dir
    if (( i%2 == 0 )); then
        bash /home/heaven/.config/dwm/script/date.sh
    fi
    if (( i%10 == 0 )); then
        bash /home/heaven/.config/dwm/script/mem.sh
    fi
    i=$(( i+1 ))
    sleep 1
    source $dir
    xsetroot -name "$_mem$_date"
done
