#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

ETH=$(ip link show | grep "state UP" | awk '{print $2}' | sed 's/://')
# Launch bar1 and bar2
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
       DRIVE=/dev/nvme0n1p1 IFETH=$ETH MONITOR=$m polybar top &
    done
else
    polybar --reload top &
fi

echo "Bars launched..."

