#!/usr/bin/python3

progress_size = 10
progress_chars = ['▏', '▎', '▍', '▌', '▋', '▊', '▉', '█']


def get_progress_bar(current):
    """Returns a formatted progress bar

    Parameters
    ----------
    current : int
        Current progress between 0 and 1
    """
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
