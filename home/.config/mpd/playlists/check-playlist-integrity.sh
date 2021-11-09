#!/bin/bash

set -e

MUSIC_DIR="/mnt/Data-Server/Corentin/Music"
PLAYLIST_FILE="./everyday.m3u"

MUSIC_TOTAL=0
MUSIC_ISSUES=0

printf "Starting music files integrity check\n"

while IFS= read -r line; do
    MUSIC_TOTAL=$(( MUSIC_TOTAL + 1 ))
    FILE_PATH="$MUSIC_DIR/$line"
    #printf '%s\n' "$FILE_PATH"
    if [ ! -f "$FILE_PATH" ]; then
        MUSIC_ISSUES=$(( MUSIC_ISSUES + 1 ))
        printf "%s: does not exist!\n" "$FILE_PATH"
    fi
done < $PLAYLIST_FILE

printf "%d/%d music files with issues.\n" $MUSIC_ISSUES $MUSIC_TOTAL
