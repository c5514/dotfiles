# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza --icons'
# alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias nv='nvim'
alias ee='exit'
alias cc='clear'
alias '..'='cd ..'
alias ff='fastfetch'
alias dwn='cd ~/Downloads'
alias doc='cd ~/Documents'
alias bye='sudo shutdown -P now'
alias syl='sudo reboot now'
alias ns='nix-shell --run bash'

eval "$(zoxide init bash)"
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\[\033[0;32m\]  \[\033[0;90m\]\[\033[0;100m\]\W\[\033[0;90m\]\[\033[0m\] \[\033[0;35m\]\$(parse_git_branch)\[\033[0;32m\]\n❯ \[\033[0m\]"

export PATH="$HOME/.config/fuzzel/scripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export MPD_HOST=/tmp/mpd_socket
export HISTCONTROL=ignoreboth
export EDITOR="nvim"
export VISUAl="nvim"
PROMPT_COMMAND="printf '\e[6 q'${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
