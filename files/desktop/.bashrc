# Load global bash config
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Utils
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias c='clear'

# Git!
alias sta='git status'
alias bra='git branch'
alias push='git push'

# workspace aliases
alias work='cd ~/Desktop/workspaces/active'
