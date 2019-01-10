#!/usr/bin/env bash

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` ]]; then
    if [[ `echo $BATTINFO | grep -P -o '\d+(?=%)'` < 5 ]]; then
          $HOME/.config/i3/i3exit suspend
    elif [[ `echo $BATTINFO | grep -P -o '\d+(?=%)'` < 20 ]]; then
        DISPLAY=:0.0 /usr/bin/notify-send -u critical -t 0 "Low Battery" "$BATTINFO"
    fi
fi
