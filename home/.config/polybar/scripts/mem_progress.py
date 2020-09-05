#!/usr/bin/python3

import os
import progress

def mem(field):
    command = "awk '/{}/ {{print $2}}' /proc/meminfo".format(field)
    output = os.popen(command).read().rstrip()
    return int(output)

mem_total = mem("MemTotal")
mem_available = mem("MemAvailable")
mem_used = mem_total - mem_available

label = "%{F#5294e2}MEM%{F-}:"
progress_bar = progress.get_progress_bar(mem_used / mem_total)

print("{}{}".format(label, progress_bar))
