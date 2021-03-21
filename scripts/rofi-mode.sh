#!/bin/sh

case $1 in
c)
	rofi -show ssh
	;;
w)
	rofi -show window
	;;
q)
	rofi -show calc -modi calc -no-show-match -no-sort
	;;
p)
	rofi -show power-menu -modi power-menu:rofi-power-menu -lines 4
	;;
m)
	~/scripts/rofi-monitor-layout.sh
	;;
t)
	~/scripts/rofi-tmux-session.sh
	;;
s)
	rofi -show screen-menu -modi screen-menu:rofi-screen-menu
esac
