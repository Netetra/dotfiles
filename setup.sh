#!/bin/bash

set -euC

function create_link() {
	if [[ -L $2 ]]; then
		echo "Found: $2"
		return 0
	fi
	ln -sf "$1" "$2"
	echo "Create: $1 -> $2"
}

create_link "$(pwd)"/home/helix /home/"$USER"/.config/helix
create_link "$(pwd)"/home/wezterm /home/"$USER"/.config/wezterm
create_link "$(pwd)"/home/fish /home/"$USER"/.config/fish
create_link "$(pwd)"/home/sway /home/"$USER"/.config/sway
create_link "$(pwd)"/home/waybar /home/"$USER"/.config/waybar
# create_link "$(pwd)"/home/sirula /home/"$USER"/.config/sirula
# create_link "$(pwd)"/home/rofi /home/"$USER"/.config/rofi
create_link "$(pwd)"/home/fuzzel /home/"$USER"/.config/fuzzel
create_link "$(pwd)"/home/mako /home/"$USER"/.config/mako
create_link "$(pwd)"/home/FreeCAD /home/"$USER"/.config/FreeCAD
