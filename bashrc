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

PS1='[\u@\h \W]\$ '

export PATH="$HOME/.config/fuzzel/scripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export MPD_HOST=/tmp/mpd_socket
export HISTCONTROL=ignoreboth
export EDITOR="nvim"
export VISUAl="nvim"
PROMPT_COMMAND="printf '\e[6 q'${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

eval "$(starship init bash)"
eval "$(zoxide init bash)"
