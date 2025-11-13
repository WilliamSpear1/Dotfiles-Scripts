#!/bin/bash
rsync -aAXv --delete --exclude-from='/home/wilabeast/exclude-file.txt' /home wspearma@192.168.50.183:/mnt/Storage/Arch_Linux_Back_Up/wspearma/BackUp
