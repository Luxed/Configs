#!/usr/bin/python3
# coding: utf-8

import os
import math
import progress

status_chars = {
        "Playing": '',
        "Paused": '',
        "Stopped": ''}
players_list = os.popen(
        "playerctl --list-all 2> /dev/null").read().rstrip().splitlines(
                keepends=False)
main_player = ""
if len(players_list) > 0:
    main_player = players_list[0]


def playerctl(command):
    formatted_command = "playerctl --player={} {} 2> /dev/null".format(
            main_player,
            command)
    return os.popen(formatted_command).read().rstrip()


artist = playerctl("metadata artist")
if artist != "":
    artist = "{} - ".format(artist)
title = playerctl("metadata title")
current_metadata = "{}{}".format(artist, title)

elements_to_print = []

status = playerctl("status")
if status == "Playing" or status == "Paused":
    current_metadata_status = "{} {}".format(
            status_chars[status],
            current_metadata)

    try:
        position = float(playerctl("position")) * 1000000
        length = float(playerctl("metadata mpris:length"))
        current = (position / length)
        progress_bar = progress.get_progress_bar(current)

        elements_to_print.append(current_metadata_status)
        elements_to_print.append(progress_bar)
    except ValueError:
        elements_to_print.append(current_metadata_status)
elif status == "Stopped":
    elements_to_print.append("")

volume = playerctl("volume")
if volume != "":
    vol = math.ceil(float(volume) * 100)
    vol_icon = ""
    if vol > 25:
        vol_icon = ""
    elif vol > 75:
        vol_icon = ""
    elements_to_print.append("{} {}%".format(vol_icon, vol))


print(" ".join(elements_to_print))
