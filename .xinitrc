#!/bin/bash
if [ -x /bin/wicd-client ]; then wicd-client -t & fi
(sleep 200; cd $HOME; git pull origin master) &
xsetroot -cursor_name left_ptr
devmon &
setxkbmap -layout es
export PATH+=:$HOME/.scripts
VGA
hsetroot -center $HOME/.background.jpg &
launchers &
buttons &
Opened_windows_bar &
volume_controller &
exec xmonad 
