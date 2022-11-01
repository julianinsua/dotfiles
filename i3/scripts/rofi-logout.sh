#!/bin/bash

string="pepito"
var=$(echo -e "Yes\nNo" | rofi -dmenu -p "Log Out?")

if [ $var = "Yes" ]; then
  i3-msg exit
fi

