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
