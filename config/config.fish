if status is-interactive
	set fish_greeting
	eval (zellij setup --generate-auto-start fish | string collect)
end
alias nv='nvim'
alias ee='exit'
alias '..'='cd ..'
alias cc='clear'
alias dwn='cd ~/Downloads'
alias doc='cd ~/Documents'
starship init fish | source
