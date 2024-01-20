#!/bin/bash
rsync -aAXv --delete --exclude-from='/home/wilabeast/exclude-file.txt' /home wilabeast@192.168.50.3:backup_home
