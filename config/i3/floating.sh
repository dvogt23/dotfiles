#!/usr/bin/env bash

if [[ ! -z $(pgrep -f 'alacritty --class __scratchpad') ]]; then
	echo true
	i3 scratchpad show
else
	echo false
	alacritty --class __scratchpad -d 120 30 &
fi
