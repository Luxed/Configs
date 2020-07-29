#!/bin/sh

dir=$(pwd)

ln -s $dir/home/.config/alacritty ~/.config/alacritty
ln -s $dir/home/.config/i3 ~/.config/i3
ln -s $dir/home/.config/rofi ~/.config/rofi
ln -s $dir/home/.config/dunst ~/.config/dunst

ln -fs $dir/home/.zshrc ~/.zshrc
