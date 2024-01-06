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
