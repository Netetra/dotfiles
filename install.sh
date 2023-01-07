#!/bin/bash

cd `dirname $0`

dotfile_path=$(pwd)

if [ "$(uname)"='Darwin' ]; then
    OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)"='Linux' ]; then
    OS='Linux'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

#Create SymbolicLink
mkdir -p ~/.config
ln -sf $dotfile_path/.zshrc ~/.zshrc
ln -sf $dotfile_path/.tmux.conf ~/.tmux.conf
ln -sf $dotfile_path/.config/alacritty ~/.config/alacritty

if [ $OS = "Linux" ]; then
    ln -sf $dotfile_path/.config/sway ~/.config/sway
    ln -sf $dotfile_path/.config/waybar ~/.config/waybar
    ln -sf $dotfile_path/.config/wofi ~/.config/wofi
    ln -sf $dotfile_path/.background ~/.background
fi

if [ $OS = "Mac" ]; then
    :
fi
