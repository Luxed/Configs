# Notes

## Ideas

- switch to Wayland by using [sway](https://github.com/swaywm/sway) as an i3 replacement and [waybar](https://github.com/Alexays/Waybar) as a polybar replacement
- Take a look at [YADM](https://yadm.io/) to manage dotfiles when/if they grow bigger
- Take a look at [linux_notification_center](https://github.com/phuhl/linux_notification_center) to replace Dunst

## TODO

- Make a personnal Open Build Service (or COPR since it supports OpenSUSE and Fedora) repository for missing packages:
  Powershell, Azure Data Studio, lsd

## Fix alacritty scaling on X11

`export $WINIT_X11_SCALE_FACTOR=1.0`
or on fish
`set -xU WINIT_X11_SCALE_FACTOR 1.0`
