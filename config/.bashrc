# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

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
