#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#conky &

# Set cursor
xsetroot -cursor_name left_ptr

# Set background
if [ -e ~/background.jpg && -x /usr/bin/feh ]; then
    feh --bg-scale ~/background.jpg
fi

# Add tray
if [ -x /usr/bin/trayer ]; then
    trayer --edge top --align right --SetDockType true --SetPartialStrut true \
      --expand true --width 5 --transparent true --alpha 0 --tint 0x111111 \
      --height 24 --padding 4 &
fi


# gnome settings and nm-applet
if [ -x /usr/bin/gnome-settings-daemon ]; then
    /usr/bin/gnome-settings-daemon &
fi 

if [ -x /usr/bin/nm-applet ]; then
    /usr/bin/nm-applet &
fi

exec xmonad

