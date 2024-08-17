#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd'
alias grep='grep --color=auto'
alias cat='bat'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
neofetch
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
