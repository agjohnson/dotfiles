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

# Xresources for resizing urxvt windows
if [ -e ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# Set defaults
xsetroot -cursor_name left_ptr
feh --bg-fill ~/background.jpg
setxkbmap -option caps:super
# For Model-M
#setxkbmap -option altwin:swap_lalt_lwin
xautolock -time 5 -locker slimlock -detectsleep &
xset b 0

. ~/bin/startup-functions.sh

start_tray
start_power
start_network
start_sound
#start_bluetooth
start_clipboard
start_display
start_notify

exec xmonad
