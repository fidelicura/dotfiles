[[ $- != *i* ]] && return

export PF_INFO="ascii title os pkgs wm shell editor"
export PF_ASCII="linux"
export PF_COLOR=1
export PF_COL1=6
export PF_COL2=8
export PF_COL3=8
export EDITOR="nvim"

alias free="free -mht"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias dmesg="dmesg --color=auto --reltime --human --nopager --decode"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

cd() { command cd "$@"; ls; }
clear() { command clear; pfetch; ls; }
bashclear() {
        history -c && history -w
        printf "\n[$] > Bash history cleared.\n"
}

COLOR_START="\[\033[01;47;30m\]"
COLOR_END="\[\033[00m\]"
PS1="
[#] \w [>] "

pfetch
ls
