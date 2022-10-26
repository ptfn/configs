#!/bin/bash

PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [[ $STATUS == "Charging" ]]; then 
    echo -e " $PERCENT%"

elif [[ $STATUS == "Full" ]]; then 
    echo -e " $PERCENT%"

else
    case $((
        $PERCENT >= 0 && $PERCENT <= 20 ? 1 :
        $PERCENT > 20 && $PERCENT <= 40 ? 2 :
        $PERCENT > 40 && $PERCENT <= 60 ? 3 : 4)) in

        (1) echo " $PERCENT%";;
        (2) echo " $PERCENT%";;
        (3) echo " $PERCENT%";;
        (4) echo " $PERCENT%";;
esac
fi