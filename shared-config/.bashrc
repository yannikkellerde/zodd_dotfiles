#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#export XDG_CURRENT_DESKTOP=KDE
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

PATH=$PATH:$HOME/.config/polybar/scripts:$HOME/.scripts

export BROWSER="firefox"
export WALLPAPERS="$HOME/Pictures/Wallpapers/Wallpapers"
