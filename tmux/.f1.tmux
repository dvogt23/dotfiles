#!/bin/env bash

# TMUXCONF: [PREFIX][SHIFT][S] -> load session
# bind S source-file ~/.tmux/session

rename-session DEOS_dev
rename-window main
send "yay -Qu" ENTER
split-window -h -p 30
send "dmesg -w" ENTER
split-window -v -p 50
send "htop -s PERCENT_CPU" ENTER
select-window -t 1
select-pane -t 1
