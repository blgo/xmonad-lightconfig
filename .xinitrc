#!/bin/bash
xcompmgr &
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
dzendate &
volume_controller &
Opened_windows_bar &
(sleep 1; transset) &
xdotool  behave_screen_edge --quiesce 500 top-left exec urxvt -rv &
exec xmonad 
