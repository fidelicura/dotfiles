[[ $- != *i* ]] && return

export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"

alias free="free -mht"
alias date='date +"%D %T"'
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias dmesg="dmesg --color=auto --reltime --human --nopager --decode"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

cd() { command cd "$@"; ls; }
clear() { command clear; neofetch; ls; }
bashclear() {
        history -c && history -w
        command clear
        neofetch
        ls
        printf "\n[$] > Bash history cleared.\n"
}

PS1="
[#] \w [>] "

neofetch
ls
