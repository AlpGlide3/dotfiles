#!/bin/sh

# not finished

monitor_list=$(xrandr | sed -n -e '/ connected/ { s/ (.*$//; s/^.*connected //; s/^primary //; p; }')
for monitor in $monitor_list
do
	monitors+=$monitor
done

read 
scrot -q 100
