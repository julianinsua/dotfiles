#!/bin/sh

if [[ $(aerospace list-windows --workspace focused | wc -l) == "       1" ]]; then
    aerospace fullscreen
fi
