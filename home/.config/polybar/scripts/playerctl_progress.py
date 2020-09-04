#!/usr/bin/python3
# coding: utf-8

import os
import time
import sys
import math
import progress

status_chars = {
        "Playing": '',
        "Paused": '',
        "Stopped": ''
        }
players_list = os.popen("playerctl --list-all 2> /dev/null").read().rstrip().splitlines(keepends=False)
main_player = ""
if len(players_list) > 0:
    main_player = players_list[0]

def playerctl(command):
    formatted_command = "playerctl --player={} {} 2> /dev/null".format(main_player, command)
    return os.popen(formatted_command).read().rstrip()

status = playerctl("status")
artist = playerctl("metadata artist")
if artist != "":
    artist = "{} - ".format(artist)
title = playerctl("metadata title")
current_metadata = "{}{}".format(artist, title)

if status == "Playing" or status == "Paused":
    current_metadata_status = "{} {}".format(status_chars[status], current_metadata)

    try:
        position = float(playerctl("position")) * 1000000
        length = float(playerctl("metadata mpris:length"))
        current = (position / length)
        progress_bar = progress.get_progress_bar(current)

        print("{} {}".format(current_metadata_status, progress_bar))
    except ValueError:
        print(current_metadata_status)
elif status == "Stopped":
    print("")
else:
    print("")
