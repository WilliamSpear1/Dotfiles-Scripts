#!/bin/sh

Download() {
    echo "DOWNLOADING..."
    xargs -n 2 -P 20 yt-dlp --cookies-from-browser firefox -o < $1
}

Edit_Download_String() {
    echo "EDITING DOWNLOAD STRING..."
    # cut out unnecessary pieces of download string.
    sed -i 's/data-dash-src=//g' $1
    sed -i 's/src=//g' $1
    sed -i 's/"//g' $1
}

Edit_Download_String $1
Download $1
