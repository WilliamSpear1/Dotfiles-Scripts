import os
import sys
import time
import logging
from watchdog.observers import Observer
from watchdog.events    import FileSystemEventHandler

logging.basicConfig(filename='/Logs/DateFiles.logs', level=logging.DEBUG, format='[%(asctime)s]:%(message)s')

def rename(path, name, newname):
    try:
        os.rename (path + '/' + name, path + '/' + newname)
        logging.info ('Successfully renamed ' + name + ' to ' + newname)
    except:
        logging.error( 'Could not rename' + name)

def get_time_creation(path, name):
    try:
        mins_time    = os.path.getmtime(path + '/' + name) 
        convert_time = time.ctime(mins_time)
        t_obj = time.strptime(convert_time)
        t_stamp = time.strftime('%Y-%m-%d_%I:%M', t_obj)
        return t_stamp
    except FileNotFoundError:
        logging.error ("Can't Find " + name)

def scan_dir(path):
    count = 0
    with os.scandir(path) as entries:
        for entry in entries:
            count = count + 1
            creation_time = get_time_creation(path, entry.name)
            if entry.name.endswith('.png') and not entry.name.__contains__('Wallpaper'):
                newname = 'Wallpaper_Number_' + str(count) + '_' + creation_time + '.png'
                rename(path, entry.name, newname)
            elif entry.name.endswith('.jpg') and not entry.name.__contains__('Wallpaper'):
                newname = 'Wallpaper_Number_' + str(count) + '_' + creation_time + '.jpg'
                rename(path, entry.name, newname)

if __name__ == '__main__':
    logging.info ('Start of program')
    wallpaper_dir = '/Wallpapers'
    scan_dir(wallpaper_dir)
    logging.info ('End of program')
