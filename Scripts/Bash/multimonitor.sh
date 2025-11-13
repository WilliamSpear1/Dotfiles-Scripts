#!/bin/sh
echo -e disconnect\nextra\nduplicate | dmenu -i -p Monitor Configuration | xargs -I % ~/Scripts/extramonitor.sh % 
~/Scripts/slideshow.sh &
