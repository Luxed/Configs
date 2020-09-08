#!/bin/sh

dir=$(pwd)

ln -s $dir/home/.config/alacritty ~/.config/alacritty
ln -s $dir/home/.config/dunst ~/.config/dunst
ln -s $dir/home/.config/fish ~/.config/fish
ln -s $dir/home/.config/i3 ~/.config/i3
ln -s $dir/home/.config/mpd ~/.config/mpd
ln -s $dir/home/.config/mpDris2 ~/.config/mpDris2
ln -s $dir/home/.config/ncmpcpp ~/.config/ncmpcpp
ln -s $dir/home/.config/picom ~/.config/picom
ln -s $dir/home/.config/polybar ~/.config/polybar
ln -s $dir/home/.config/rofi ~/.config/rofi

ln -fs $dir/home/.zshrc ~/.zshrc

ln -s $dir/home/scripts ~/scripts
