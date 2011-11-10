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

# Local defaults for fonts
if [ -e ~/.Xdefaults.local ]; then
    xrdb ~/.Xdefaults.local
fi

# Set cursor
xsetroot -cursor_name left_ptr

# Add tray
if [ -x /usr/bin/trayer ]; then
    trayer --edge top --align right --SetDockType true --SetPartialStrut true \
      --expand true --width 7 --transparent true --alpha 0 \
      --tint 0x111111 --height 24 --padding 4 &
fi

# Network
if [ -x /usr/bin/nm-applet ]; then
    /usr/bin/nm-applet &
fi

# Sound
if [ -x /usr/bin/volti ]; then
    /usr/bin/volti &
elif [ -x /usr/bin/gnome-volume-control-applet ]; then
    /usr/bin/gnome-volume-control-applet &
fi

exec xmonad

