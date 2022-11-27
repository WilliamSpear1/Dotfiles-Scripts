#!/bin/sh

dirname=$(dirname "${BASH_SOURCE:-$0}")
cwd=$(pwd)
power=$($(dirname "${BASH_SOURCE:-$0}") && pwd)

echo "Dirname" $dirname
echo "--------------------------------------"
echo "Current working directory" $cwd
echo "--------------------------------------"
echo "Combination" $power
echo "--------------------------------------"
