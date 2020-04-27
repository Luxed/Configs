export PATH=~/.cargo/bin:~/.yarn/bin:~/work/cloud/development-tools/scripts:$PATH
export ZSH="/home/cbrunel/.oh-my-zsh"
export FEEDZ_API_KEY="T-RFUVAN2tvDAsmwGx9WblLTgwUMJIPvHF1Q"
export NPM_AUTH_TOKEN="VC1SRlVWQU4ydHZEQXNtd0d4OVdibExUZ3dVTUpJUHZIRjFR"
export NOMADIS_SENDGRID_PASSWORD="a"

ZSH_THEME="avit"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias nvgkt="nvim-gtk"
alias ls="lsd"

eval $(thefuck --alias)
