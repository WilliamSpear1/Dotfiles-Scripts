#!/bin/python

import os

command = 'yes | sudo pacman -Syu'

def update():
    try:
        result = os.system(command)
        print(result)
        exit(0)
    except:
        print("Error")
        exit(1)

if __name__ == "__main__":
   update()
