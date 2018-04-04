#!/usr/bin/env bash

if [[ ! -z $(pgrep -f 'st -n__scratchpad') ]]; then
	echo true
	i3 scratchpad show
else
	echo false
	st -n__scratchpad &
fi
