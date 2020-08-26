#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
player_metadata_formated=$(playerctl metadata --format '{{artist}} - {{title}} | {{duration(position)}}/{{duration(mpris:length)}}' 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo " $player_metadata_formated"
elif [ "$player_status" = "Paused" ]; then
    echo " $player_metadata_formated"
elif [ "$player_status" = "Stopped" ]; then
    echo ""
else
    echo ""
fi
