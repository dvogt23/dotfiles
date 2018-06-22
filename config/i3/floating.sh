#!/usr/bin/env bash

if [[ ! -z $(pgrep -f 'alacritty --class __scratchpad') ]]; then
	echo true
	i3 scratchpad show
else
	echo false
	alacritty --class __scratchpad -d 200 50 &
fi
