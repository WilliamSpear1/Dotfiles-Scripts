function fish_prompt
    powerline-shell --shell bare $status
end

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
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if status is-interactive
    # Commands to run in interactive sessions can go here
end
