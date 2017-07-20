#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -la'
alias ll="la"
alias grep='grep --color=auto'
alias pacup='pacaur -Syyu'
alias pacinst='pacaur -S'
alias pacrem='pacaur -R'
alias pacsearch='pacaur -Ss'
alias mode="~/.scripts/mode"
alias maintenance="~/.scripts/maintenance"

export PYTHONPATH="/usr/lib/python3.5/site-packages"

PS1='\[\e[36;1m\]\u \[\e[35;3m\]\w\[\e[33m\] ==> \[\e[0m\]'
# >>>>BEGIN ADDED BY CNCHI INSTALLER<<<< #
BROWSER=/usr/bin/chromium
VISUAL=/usr/bin/vim
EDITOR=/usr/bin/vwim
# >>>>>END ADDED BY CNCHI INSTALLER<<<<< #
