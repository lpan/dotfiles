# Path to your oh-my-zsh installation.
export ZSH=/home/lawrence/.oh-my-zsh

# Antigen
source /home/lawrence/.antigen/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

# Minimalist theme
# ZSH_THEME="wezm"

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:$HOME/Workspaces/bin"
export PATH="$PATH:$HOME/.bin"

export ANDROID_HOME=~/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools

# manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

export SSH_KEY_PATH="~/.ssh/dsa_id"

export NVM_DIR="/home/lawrence/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GOPATH=$HOME/Desktop/workspaces/go

DEFAULT_USER='lawrence'

# If not running interactively, do not do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

#####
# Aliases
alias c='clear'
alias l='ls'
alias ll='ls -la'
alias tmux='tmux -2'
alias vim='nvim'

#####
# Git aliases
alias gaa='git add -A'
alias gc='git commit'
alias gd='git diff --color=always | less -r'
alias gca='git commit --amend --reuse-message=HEAD'
alias gp='git push origin HEAD'
alias gs='git status'
alias glog="git log --pretty=format:'%C(yellow)%h%Creset %Cblue%an%Creset %s %Cgreen(%ar)%Creset %Cred%d%Creset'"

#####
# Workspace aliases
alias work='cd ~/Desktop/workspaces'
alias play='cd ~/Desktop/workspaces/playground'
alias loo='cd ~/Documents/waterloo'
