# Dotfiles/Scripts  
### Contributors
    - William Spearman
### Scripts
#### All bash scripts are within the Scripts folder
    * wifi_connect.sh is a bash script utilizing nmcli to connect to a wifi using user input
    * slideshow.sh is a bash script for displaying images in a slideshow utilizing feh background tool
    * PasswordGen.sh is a bash script for generation of password utiliting pwgen command line tool
    * update.sh is a bash script for updating the system utilizing the package manager (Specific to distro)
### Dotfiles
#### Dotfiles Located in Home Directory
    * .bashrc -> config file for the Bash terminal
    * .tmux.conf -> config file for Tmux (terminal multipler)
    * .vimrc -> config file for Vim (Text Editor)
    * .Xinitrc -> config file for X display Server
#### Dotfiles Located in ~/.config Directory
    * Config File for i3 which holds aliases and Keyboard shortcuts for i3 window manager
    * Config File for neofetch program which displays various diagnostic measures of a system
    * Config File for picom a compositor for Xorg
    * Config File for powerline-shell which holds colorscheme and font for powerline bash shell
#### Dotfiles Located in ~/.vim Directory 
    * Config files for vim plug (Vim plug manager for various installation)
    * These files are unedited and will still unedited in foreseen future
### Need Software Programs for Dotfiles
    * feh
    * vim
    * Xorg
    * tmux
    * powerline-shell
    * bash
    * i3
    * neofetch
    * picom
#### Installation process for aforementioned Software
##### Installation process varies depending on package manager(Specific to Linux)
##### This will detail the process on the Ubuntu Distro 
        * sudo apt-get install feh (Distros such as Ubuntu come with display software installed)
        * sudo apt-get install vim (Distros such as Ubuntu come with vim as a default text editor
        * Xorg is a display server most Distros come with display server installation mostly not necessary
        * sudo apt-get install bashv(Distros such as Ubuntu come with Bourne Again Shell as default shell)
        * sudo apt-get install i3
        * sudo apt-get nintall neofetch
        * sudo apt-get install picom
        * Powerline-Shell
            -sudo apt-get install python3-pip
            -pip install powerline-shell
