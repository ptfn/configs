#!/bin/bash

PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [[ $STATUS == "Charging" ]]; then 
    echo -e " $PERCENT%"

elif [[ $STATUS == "Full" ]]; then 
    echo -e " $PERCENT%" 

else
    # sleep 1
    case $((
        $PERCENT >= 0 && $PERCENT <= 20 ? 1 :
        $PERCENT > 20 && $PERCENT <= 30 ? 2:
        $PERCENT > 30 && $PERCENT <= 65 ? 3 :
        $PERCENT > 65 && $PERCENT <= 85 ? 4 : 5)) in

        (1) echo " $PERCENT%" && systemctl suspend;;
        (2) echo " $PERCENT%" && brightnessctl set 10%;;
        (3) echo " $PERCENT%";;
        (4) echo " $PERCENT%";;
        (5) echo " $PERCENT%";;
    esac
fi
