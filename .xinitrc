#!/bin/bash
xsetroot -cursor_name left_ptr
devmon &
setxkbmap -layout es
hsetroot -center $HOME/.background.jpg &
git pull origin master
$HOME/launchers &
$HOME/buttons &
$HOME/Opened_windows_bar &
$HOME/volume_controller &
if [ -x /bin/wicd-client ]; then wicd-client -t & fi
echo " a ver si ahora funciona?" | dzen2 -p
sleep 0.1 && exec xmonad 
