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
alias ns='nix-shell --run fish'
# alias cd='z'
alias ll='ls -l'

starship init fish | source
zoxide init fish | source

export VISUAL=nvim
export EDITOR="$VISUAL"

function set_cursor --on-event fish_prompt
    echo -ne '\e[6 q'
end
