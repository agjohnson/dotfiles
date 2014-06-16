#!/bin/sh

# Clipboard
start_clipboard () {
    if [ -x /usr/bin/autocutsel ]; then
        autocutsel -f -s PRIMARY
        autocutsel -f
    fi
}

# Trayer
start_tray () {
    margin=$1
    if [ -x /usr/bin/trayer ]; then
        trayer --edge top --align right --SetDockType true --SetPartialStrut true \
          --expand true --width 155 --widthtype pixel --transparent true --alpha 0 \
          --tint 0x3f3f35 --height 26 --padding 4 --margin ${margin:-0} &
    fi
}

# Power
start_power () {
    if [ -x /usr/bin/batti ]; then
        /usr/bin/batti &
    fi
}

# Network
start_network () {
    if [ -x /usr/bin/wicd-gtk ]; then
        /usr/bin/wicd-gtk &
    elif [ -x /usr/bin/nm-applet ]; then
        /usr/bin/nm-applet &
    fi
}

# Sound
start_sound () {
    if [ -x /usr/bin/volti ]; then
        /usr/bin/volti &
    elif [ -x /usr/bin/gnome-volume-control-applet ]; then
        /usr/bin/gnome-volume-control-applet &
    fi
}

# Bluetooth
start_bluetooth () {
    if [ -x /usr/bin/blueman-applet ]; then
        /usr/bin/blueman-applet &
    fi
}

# Display
start_display () {
    if [ -x /usr/bin/redshift ]; then
        /usr/bin/redshift &
    fi
}

# Notify
start_notify () {
    if [ -x /usr/bin/dunst ]; then
        /usr/bin/dunst -config ~/.dunstrc &
    fi
}
