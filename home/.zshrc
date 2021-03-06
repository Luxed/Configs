export PATH=~/scripts:~/.cargo/bin:~/.yarn/bin:~/work/cloud/development-tools/scripts:$PATH
export ZSH="/home/cbrunel/.oh-my-zsh"

if test -e ~/work/.work-env; then
    source ~/work/.work-env
fi

ZSH_THEME="avit"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias nvgkt="nvim-gtk"
alias ls="lsd --group-dirs first"
alias cp="rsync -ah --progress"

eval $(thefuck --alias)
