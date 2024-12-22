if status is-interactive
	set fish_greeting
end
alias nv='nvim'
alias ee='exit'
alias '..'='cd ..'
alias cc='clear'
alias dwn='cd ~/Downloads'
alias doc='cd ~/Documents'
alias ff='fastfetch'
alias ls='eza --icons'
# alias cd='z'
alias ll='ls -l'

starship init fish | source
zoxide init fish | source

fish_add_path /home/c5514/.spicetify

export VISUAL=nvim
export EDITOR="$VISUAL"

