#!/bin/sh

choice="$(echo ' Log Out|累 Restart| Power Off' | rofi -dmenu -i -p 'Menu' -sep '|' -lines 3 -width 12 -location 5 -yoffset -25 -xoffset -5 )"

case "$choice" in
    *"Log Out")
        logout
        ;;
    *Restart)
        reboot
        ;;
    *"Power Off")
        shutdown
        ;;
esac
