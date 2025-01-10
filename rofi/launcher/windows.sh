#!/bin/bash

#  _       ___           __              _______           __         
# | |     / (_)___  ____/ /___ _      __/ ____(_)___  ____/ /__  _____
# | | /| / / / __ \/ __  / __ \ | /| / / /_  / / __ \/ __  / _ \/ ___/
# | |/ |/ / / / / / /_/ / /_/ / |/ |/ / __/ / / / / / /_/ /  __/ /    
# |__/|__/_/_/ /_/\__,_/\____/|__/|__/_/   /_/_/ /_/\__,_/\___/_/     
#                                                                     


dir="$HOME/.config/rofi/launcher/"
theme='windows'

# Function to find an icon for a given app class
find_icon() {
    local app_class=$1
    icon_path=""

    # Adjust these icon theme paths as necessary
    if [ -f "/usr/share/icons/hicolor/48x48/apps/${app_class}.png" ]; then
        icon_path="/usr/share/icons/hicolor/48x48/apps/${app_class}.png"
    elif [ -f "/usr/share/icons/breeze-dark/apps/48/${app_class}.svg" ]; then
        icon_path="/usr/share/icons/breeze-dark/apps/48/${app_class}.svg"
    else
        # Fallback to a default icon if not found
        icon_path="/usr/share/icons/breeze-dark/apps/48/system-file-manager.svg"
    fi

    echo "$icon_path"
}

# Get list of all windows using hyprctl in JSON format
windows=$(hyprctl clients -j)

# Prepare rofi menu entries and store addresses
rofi_menu=""
addresses=""
while read -r window; do
    # Extract window class (app name), title, and address
    app_class=$(echo "$window" | jq -r '.class')
    window_title=$(echo "$window" | jq -r '.title')
    window_address=$(echo "$window" | jq -r '.address')

    # Find icon for the app class
    icon_path=$(find_icon "$app_class")

    # Build the rofi entry with icon, class, and title
    rofi_menu+="${window_title}\0icon\x1f${icon_path}\n"

    # Collect addresses in the same order
    addresses+="$window_address\n"
done < <(echo "$windows" | jq -c '.[]')

echo -e "$rofi_menu"

# Show the window list in rofi and capture the selected window
selected=$(echo -e "$rofi_menu" | rofi -dmenu -theme ${dir}/${theme}.rasi -markup-rows -p "Select window:")

# If nothing is selected, exit
[ -z "$selected" ] && exit 1

# Find the line number of the selected window (1-based index)
line_number=$(echo -e "$rofi_menu" | grep -n -F -a "$selected" | cut -d: -f1)

# Extract the corresponding window address using the line number
window_address=$(echo -e "$addresses" | sed -n "${line_number}p")

# Focus the selected window using hyprctl
hyprctl dispatch focuswindow "address:$window_address"
