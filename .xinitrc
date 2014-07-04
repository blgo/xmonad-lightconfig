#!/bin/bash
synclient PalmDetect=1
synclient PalmMinWidth=3
synclient PalmMinZ=100
hsetroot -solid "#000000"
xcompmgr -f &
if [ -x /bin/wicd-client ] && [ -z "$(ps -e | grep wpa_supplicant)" ]; then wicd-client -t & fi
(sleep 200; cd $HOME; git pull origin master; ) &
xsetroot -cursor_name left_ptr -rv 
devmon &
setxkbmap -layout es
export PATH+=:$HOME/.scripts
VGA
hsetroot -center $HOME/.background.jpg &
launchers &
current_window &
Opened_windows_bar &
(sleep 1; transset) &
xdotool  behave_screen_edge --delay 1500 --quiesce 500 top-left exec urxvt -tr -rv -tint darkgrey -rv &
xdotool  behave_screen_edge --delay 500 --quiesce 500 bottom-left exec  xdotool key alt+Tab &
xdotool  behave_screen_edge --delay 500 --quiesce 500 bottom-right exec  xdotool key alt+shift+Tab &
exec xmonad 
