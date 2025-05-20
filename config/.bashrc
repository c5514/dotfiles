export VISUAL=nvim
export EDITOR="$VISUAL"

alias nv="nvim"
alias ee="exit"
alias ".."="cd .."
alias cc="clear"
alias dwn="cd ~/Downloads"
alias doc="cd ~/Documents"
alias ff="fastfetch"
alias ls="eza --icons"
alias ll="ls -l"
alias la="ll -a"

eval "$(starship init bash)"
eval "$(zoxide init bash)"
