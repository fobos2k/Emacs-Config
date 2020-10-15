#!/bin/bash

# Script to show current keyboard layout in i3status bar
# Requires https://github.com/nonpop/xkblayout-state

# Inspiration for wather display:
# https://keheliya.blogspot.com/2018/01/weather-info-in-i3status.html
# Suggested crontab entry:
# */5 * * * * curl -s wttr.in/?format=3\&m > ~/.weather.cache

i3status | while :
do
    read line

    W=$(cat ~/.weather.cache | tail -n 1)
    LG=$(xkblayout-state print "%s" | tr -d '\n\r')
    echo "${W} | ${LG} | ${line}" || exit 1
done
