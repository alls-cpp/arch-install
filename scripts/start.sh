#!/bin/sh
#
wall=$(find /home/alls/Pictures/backgrounds/ -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)

nitrogen --set-auto $wall
picom -b
