#!/bin/env bash

# TMUXCONF: [PREFIX][SHIFT][S] -> load session
# bind S source-file ~/.tmux/session

rename-session DEOS_dev
rename-window main
send "checkupdates" ENTER
split-window -h -p 50
send "dmesg -w" ENTER
split-window -v -p 50
send "htop -s PERCENT_CPU" ENTER
new-window -n opensetup
send "opensetup.all" ENTER
split-window -v -p 50
select-window -t 1
select-pane -t 1
