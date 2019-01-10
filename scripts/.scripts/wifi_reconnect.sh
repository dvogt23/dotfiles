#!/usr/bin/env bash
while true;
do
    if ! ping -c1 -w3 1.1.1.1 > /dev/null
    then
        echo $(date -Is) 'reconnecting'
        systemctl restart netctl-auto@wlp2s0.service
        sleep 30
    fi
    sleep 1
done
