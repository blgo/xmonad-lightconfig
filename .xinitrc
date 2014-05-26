#!/bin/bash
hsetroot -solid "#000000"
xcompmgr -f &
if [ -x /bin/wicd-client ]; then wicd-client -t & fi
(sleep 200; cd $HOME; git pull origin master) &
xsetroot -cursor_name left_ptr -rv 
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
<<<<<<< HEAD
xdotool  behave_screen_edge --delay 900 --quiesce 500 top-left exec urxvt -tr -rv -tint darkgrey -rv &
xdotool  behave_screen_edge --delay 900 --quiesce 500 top-right exec htop_script &
=======
xdotool  behave_screen_edge --delay 500 --quiesce 500 top-left exec urxvt -rv &
>>>>>>> 2cef7848c2728f8b2c05b1ebd43540c8d0df5f1a
exec xmonad 
