#!/bin/bash
stream=$(xclip -o)
streamlink -p mpv $stream best,high 
