#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

primary_monitors=$(polybar --list-monitors | grep primary | cut -d":" -f1)
other_monitors=$(polybar --list-monitors | grep -v primary | cut -d":" -f1)

if [ -z $primary_monitors ]
then
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload primary &
    done
else
    for m in $primary_monitors; do
        MONITOR=$m polybar --reload primary &
    done

    for m in $other_monitors; do
        MONITOR=$m polybar --reload other &
    done
fi
