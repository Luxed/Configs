#!/bin/sh

# available container states:
# created, restarting, running, removing, paused, exited, dead

ACTIVE=$(systemctl is-active docker)

if [ "$ACTIVE" = "inactive" ]; then
    echo ""
else
    STATUS="running exited dead"

    for stat in $STATUS; do
        output="$output $(docker ps -qf status="$stat" | wc -l) |"
    done

    echo "|$output"
fi
