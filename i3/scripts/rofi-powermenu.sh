#!/bin/bash

var=$(echo -e "  Lock\n  Shutdown\n  Restart\n  LogOut\n鈴  Suspend" | rofi -dmenu -p "Going to?")

if [[  $var = "  LogOut" ]]; then
  i3-msg exit
elif [[  $var = "  Shutdown" ]]; then
  shutdown -h now  
elif [[  $var = "  Restart" ]]; then
  reboot
elif [[ $var = "鈴  Suspend" ]]; then
  systemctl suspend
elif [[ $var = "  Lock" ]]; then
  i3lock --nofork -c 000000
  #KDE does: qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock
fi

