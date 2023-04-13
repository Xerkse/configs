#
# ~/.bashrc
#

#canges bindings in terminal to be like vi
set -o vi

#add .local/bin to execute path
#export PATH="$HOME/.local/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon #Disable ctrl-s and ctrl-q.
shopt -s autocd
HISTSIZE= HISTFILESIZE= #Infinite history.

#user colors
PS1='[\u@\h \W]\$ '

#ising LF to cd into directory with bound to Ctrl + o to blank line theh run lfcd
LFCD="/home/xerkse/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

#binds command to execute lfcd
bind '"\C-o":"\C-ulfcd\C-m"'
#bind '"\C-O":"\C-ust -e lfcd &\C-m"'
bind '"\C-t":"\C-unewTerminal\C-m"'
#tring to bind caps to esc
#setxkbmap -option caps:swapescape

alias ls='ls -lah --color=auto'
alias p="sudo pacman"
alias v="nvim"
alias sv="sudo nvim"
alias lf="lfub"
alias s="startx"
alias mkd="mkdir -pv"
alias grep="grep --color=auto"
. "$HOME/.cargo/env"
