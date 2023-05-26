[[ $- != *i* ]] && return

export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"

alias free="free -mht"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias onefetch="onefetch $HOME/Dotfiles --no-color-palette -d languages"
alias dmesg="dmesg --color=auto --reltime --human --nopager --decode"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

cd() { command cd "$@"; ls; }
clear() { command clear; onefetch; ls; }
bashclear() {
        history -c && history -w
        printf "\n[$] > Bash history cleared.\n"
}

PS1="
[#] \w [>] "

onefetch
ls
