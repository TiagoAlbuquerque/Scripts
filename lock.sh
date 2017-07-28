#!/usr/bin/env bash

icon=$HOME/Pictures/Icons/lock.png
tmpbg=/tmp/screen.png


(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 5% -scale 2000% "$tmpbg"
#para um monitor
#convert "$tmpbg" $icon -gravity center -geometry +0+72 -composite -matte "$tmpbg"
#para dois monitores
convert "$tmpbg" $icon -gravity center -geometry +960+72 -composite -matte "$tmpbg"
convert "$tmpbg" $icon -gravity center -geometry -960+72 -composite -matte "$tmpbg"
i3lock -i "$tmpbg"
sleep 60; pgrep i3lock && xset dpms force off
rm "$tmpbg"
