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
((while true; do date +%H:%M; sleep 60; done;) | dzen2 -bg "#224466" -e '' -expand right) &
Opened_windows_bar &
volume_controller &
zenity --warning --text="Hola Fran\nTienes que instalar un Programa:\nsudo pacman -S xdotool\n Instalalo o de lo contrario\n los botones de abajo no funcionarán."
exec xmonad 
