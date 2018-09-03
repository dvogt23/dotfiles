#!/usr/bin/env bash

RES=$(echo "$@" | bc)

# Path to menu application
if [[ -n $(command -v rofi) ]]; then
    menu="$(command -v rofi) -dmenu"
elif [[ -n $(command -v dmenu) ]]; then
    menu="$(command -v dmenu)"
else
    echo >&2 "Rofi or dmenu not found"
    exit
fi

ENTER=$($menu -p "c $RES")

if [ $ENTER != "" ]; then
    c.sh $RES $ENTER
fi

