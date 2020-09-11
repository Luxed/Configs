#!/bin/sh

nbr_updates=$(zypper lu | grep "v |" | wc -l)

echo "%{F#5294e2}%{F-} $nbr_updates"
