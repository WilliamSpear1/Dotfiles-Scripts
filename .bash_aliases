##################
# Aliases        #
##################
alias update='source /home/wilabeast/Scripts/Bash/update.sh'
alias wifi='source /home/wilabeast/Scripts/Bash/wifi_connect.sh'
alias net='source /home/wilabeast/Scripts/Bash/default_network.sh'
alias tstart='source /home/wilabeast/Scripts/Bash/tmux_start.sh'
alias tend='source /home/wilabeast/Scripts/Bash/tmux_end.sh'
alias tls='tmux ls'
alias gondolin='ssh gondolin'
alias video='source /home/wilabeast/Scripts/Bash/mount.sh'
alias gb='git branch'
alias gp='git pull'
alias gc='git checkout'
alias gs='git status'
alias gst='git stash'
alias v=vim
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias angmar="ssh angmar"
alias watch="source /home/wilabeast/Scripts/Bash/Watch.sh"
alias backup="source /home/wilabeast/Scripts/Bash/BackUp.sh"
alias upload="source /home/wilabeast/Scripts/Bash/Optimized_Upload.sh"
alias nfs="source /home/wilabeast/Scripts/Bash/NFS.sh"
alias vq="source /home/wilabeast/Scripts/Bash/VideoQuality.sh"
alias search="source /home/wilabeast/Scripts/Bash/Search.sh"
alias ydl="python /home/wilabeast/PycharmProjects/Selenium/main.py"
alias download="nohup python /home/wilabeast/PycharmProjects/Selenium/bg_run.sh &"
alias trim="source /home/wilabeast/Scripts/Bash/Trim.sh"
alias db="source /home/wilabeast/Scripts/Bash/docker_build.sh"
alias dt="source /home/wilabeast/Scripts/Bash/docker_tag.sh"
alias dp="source /home/wilabeast/Scripts/Bash/docker_push.sh"
alias dl="source /home/wilabeast/Scripts/Bash/docker_pull.sh"
alias celery="source /home/wilabeast/Scripts/Bash/CeleryDocker.sh"
alias send="source /home/wilabeast/Scripts/Bash/Curl.sh"
