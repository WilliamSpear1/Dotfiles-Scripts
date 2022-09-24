import shutil
import time
import logging
import os
import sys
from watchdog.observers import Observer
from watchdog.events    import FileSystemEventHandler

source_directory            = "/home/wilabeast/Downloads"
destination_directory_image = "/home/wilabeast/Wallpapers"
destination_directory_video = "/home/wilabeast/Videos"

logging.basicConfig(
        filename ='/home/wilabeast/Logs/ImageDetection.logs', 
        level=logging.DEBUG, 
        format='[%(asctime)s]:%(message)s'
)

# TODO: When a file already exists delete the file in Downloads, then move that file
# TODO: to Videos.

def move_video(destination, entry, name):
    file_exists = os.path.exists(destination + '/' + name)
    if not file_exists:
        shutil.move(entry, destination)
        logging.info ("In move_video function")
        logging.info ("Successful move of" + name)

def move_image(destination, entry, name):
    file_exists = os.path.exists(destination + '/' + name)
    
    if not file_exists:
        shutil.move(entry, destination)
        logging.info ("In move_image function")
        logging.info ("Successful move of" + name)

class MoverHandler(FileSystemEventHandler):
    with os.scandir(source_directory) as entries:
        for entry in entries:
            name = entry.name
            
            if name.endswith('.jpg') or name.endswith('.jpeg') or name.endswith('.png'):
                destination = destination_directory_image
                move_image(destination, entry, name)

            elif name.endswith('.mp4'):
                destination = destination_directory_video
                move_video(destination, entry, name)

if __name__ == "__main__":
    logging.info ("Start of program")
    
    path          = source_directory
    event_handler = MoverHandler()
    observer      = Observer()
    
    observer.schedule(event_handler, path, recursive=True)
    observer.start()
    
    
    try:
        while True:
            time.sleep(10)
    except KeyboardInterrupt:
        observer.stop()
    
    logging.info ("End of program")
    
    observer.join()
