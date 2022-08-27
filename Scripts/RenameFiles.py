import os
import sys
import time
import logging
from watchdog.observers import Observer
from watchdog.events    import FileSystemEventHandler

logging.basicConfig(filename='/home/wilabeast/Logs/RenameFiles.logs', level=logging.DEBUG, format='[%(asctime)s]:%(message)s')

def rename(path, name, newname):
    file_exists = os.path.exists(path + "/" + name)
    if file_exists:
        try:
            os.rename    (path + "/" + name, path + "/" + newname)
            logging.info ("Successfully renamed " + name + " to " + newname)  
        except FileNotFoundError:
            logging.error ("Can't Find " + name)

def scan_dir(path):
    count = 0
    with os.scandir(path) as entries:
        for entry in entries:
            count = count + 1
            if entry.name.endswith('.png') and not entry.name.__contains__('Wallpaper_Number'):
                Filename = "Wallpaper_Number_" + str(count) + ".png"           
                rename(path, entry.name, Filename)
            elif entry.name.endswith('.jpg') and not entry.name.__contains__('Wallpaper_Number'):
                Filename = "Wallpaper_Number_" + str(count) + ".jpg"           
                rename(path, entry.name, Filename)

if __name__ == "__main__":
    wallpaper_dir = "/home/wilabeast/Mountain-Wallpapers"
    scan_dir(wallpaper_dir)
    logging.info ("End of program")
