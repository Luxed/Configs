#!/bin/bash

set -e

MUSIC_DIR="/mnt/Data-Server/Corentin/Music"
PLAYLIST_FILE="./everyday.m3u"

while IFS= read -r line; do
    #printf '%s\n' "$MUSIC_DIR/$line"
    if [ ! -f "$MUSIC_DIR/$line" ]; then
        printf '%s: does not exist!\n' "$MUSIC_DIR/$line"
    fi
done < $PLAYLIST_FILE
