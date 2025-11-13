#!/bin/sh
Quality() {
    QUALITY=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 $file)
    echo $file $QUALITY
}

directory_path=$1

for file in $directory_path/*; do 
    if [ ${file: -4} == .mp4 ]; then
        Quality $file
    fi
done

