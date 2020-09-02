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

if status == "Playing" or status == "Paused":
    position = float(os.popen("playerctl metadata --format \"{{position}}\"").read().strip())
    length = float(os.popen("playerctl metadata --format \"{{mpris:length}}\"").read().strip())
    max_percent = 100
    current = (position / length) * max_percent

    progress_steps = len(progress_chars)
    progress_ratio = (float(max_percent) / float(progress_steps)) / float(progress_size)

    current_progress = (current / progress_ratio)

    progress_finished = int(current_progress/progress_steps)

    progress_char_index = current_progress - (progress_steps * progress_finished)
    char = progress_chars[int(progress_char_index)]

    before = progress_chars[progress_steps-1]*progress_finished
    after = " "*(progress_size - progress_finished - 1)

    print("{} {} ▕{}{}{}▏".format(status_chars[status], current_metadata, before, char, after))
elif status == "Stopped":
    print("")
else:
    print("")
