#!/usr/bin/env bash

dir="$HOME/.config/rofi/launcher/"
theme=clipboard

# Run
cliphist list | rofi -dmenu -theme ${dir}/${theme}.rasi -markup-rows -p "Clipboard history:" | cliphist decode | wl-copy

# Original code for the picker
# cliphist list | rofi -dmenu | cliphist decode | wl-copy
