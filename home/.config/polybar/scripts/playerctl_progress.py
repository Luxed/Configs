#!/usr/bin/python3
# coding: utf-8

import os
import time
import sys
import math

progress_size = 10
progress_chars = ['▏', '▎', '▍', '▌', '▋', '▊', '▉', '█']
status_chars = {
        "Playing": '',
        "Paused": '',
        "Stopped": ''
        }
status = os.popen("playerctl status 2> /dev/null").read().rstrip()
current_metadata = os.popen("playerctl metadata --format '{{artist}} - {{title}}' 2> /dev/null").read().rstrip()

def format_progress_bar(progress_chars, progress_size, current):
    current_percent = current * 100
    progress_steps = len(progress_chars)
    progress_ratio = (float(100) / float(progress_steps)) / float(progress_size)

    current_progress = (current_percent / progress_ratio)

    progress_finished = int(current_progress/progress_steps)

    progress_char_index = current_progress - (progress_steps * progress_finished)
    char = progress_chars[int(progress_char_index)]

    before = progress_chars[progress_steps-1]*progress_finished
    after = " "*(progress_size - progress_finished - 1)

    return "▕{}{}{}▏".format(before, char, after)

if status == "Playing" or status == "Paused":
    current_metadata_status = "{} {}".format(status_chars[status], current_metadata)

    try:
        position = float(os.popen("playerctl metadata --format \"{{position}}\"").read().strip())
        length = float(os.popen("playerctl metadata --format \"{{mpris:length}}\"").read().strip())
        current = (position / length)
        progress_bar = format_progress_bar(progress_chars, progress_size, current)

        print("{} {}".format(current_metadata_status, progress_bar))
    except ValueError:
        print(current_metadata_status)
elif status == "Stopped":
    print("")
else:
    print("")
