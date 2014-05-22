[[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec startx
[[ -z $DISPLAY && $XDG_VTNR -eq 3 ]] && exec startx
