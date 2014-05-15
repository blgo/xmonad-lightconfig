#!/bin/bash
xsetroot -cursor_name left_ptr
devmon &
setxkbmap -layout es
hsetroot -center $HOME/.background.jpg &
export PATH+=:$HOME/.scripts
VGA &
(sleep 1; launchers) &
(sleep 1; buttons) &
(sleep 1; Opened_windows_bar) &
volume_controller &
if [ -x /bin/wicd-client ]; then wicd-client -t & fi
(sleep 200; cd $HOME; git pull origin master) &
sleep 0.1 && exec xmonad 
