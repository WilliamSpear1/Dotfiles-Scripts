#!/bin/sh
# cut out unneccesary pieces of download string.
sed -i 's/src=//g' $1
sed -i 's/"//g' $1
