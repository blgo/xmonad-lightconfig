#!/bin/bash
xsetroot -cursor_name left_ptr
devmon &
setxkbmap -layout es
hsetroot -center $HOME/.background.jpg &
$HOME/launchers &
$HOME/buttons &
$HOME/Opened_windows_bar &
$HOME/volume_controller &
#wicd-client -t &
sleep 0.1 && exec xmonad 
