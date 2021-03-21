#!/bin/sh

# not finished

# xrandr | sed -n -e '/connected/; s/ (.*$//; s/^.*connected //; s/^primary //'
monitor_list=$(xrandr | sed --posix -n -e '/ connected/ { s/ (.*$//; s/^.*ected //; p; }')
for monitor in $monitor_list
do
	monitors+=$monitor
done

