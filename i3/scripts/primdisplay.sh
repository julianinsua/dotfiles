#! /bin/bash

# Detect monitors and set the primary display

# Get a list of display names
HDMI=$( xrandr --listmonitors | awk '{print $4}' | grep HDMI | head -n 1 )

if [[ -n $HDMI ]]
then
  echo $HDMI
  xrandr --output $HDMI --primary
fi
