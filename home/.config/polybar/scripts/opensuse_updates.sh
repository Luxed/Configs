#!/bin/sh

nbr_updates=$(zypper lu | grep "v |" | wc -l)

if [ $nbr_updates != 0 ]; then
    echo "%{F#5294e2}%{F-} $nbr_updates"
else
    echo ""
fi
