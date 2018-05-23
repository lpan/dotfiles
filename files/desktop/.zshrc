# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Antigen
source $HOME/.antigen/antigen/antigen.zsh

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

# go
export GOPATH=$HOME/Workspace/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# Install Ruby Gems to ~/.gems'
export GEM_HOME=$HOME/.gems
export PATH=$HOME/.gems/bin:$PATH

# manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/dsa_id"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

DEFAULT_USER='lpan'

export ANDROID_HOME=$HOME/Workspace/Android
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

#####
# Aliases
alias c='clear'
alias l='ls'
alias ll='ls -la'
alias tmux='tmux -2'
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dcr='docker-compose run'
alias mine='sudo chown -R $USER:$USER .'

alias octave='octave --no-gui'
alias racket='rlwrap racket'

alias vs='expressvpn status'
alias vc='expressvpn connect'
alias vd='expressvpn disconnect'

#####
# Git aliases
alias gaa='git add -A'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff --color=always | less -r'
alias gca='git commit --amend --reuse-message=HEAD'
alias gp='git push origin HEAD'
alias gpf='git push origin HEAD --force'
alias gs='git status'
alias glog="git log --pretty=format:'%C(yellow)%h%Creset %Cblue%an%Creset %s %Cgreen(%ar)%Creset %Cred%d%Creset'"
alias gfu='git fetch upstream master'
alias gru='git rebase upstream/master'

#####
# Workspace aliases
alias work='cd ~/Workspace'
alias play='cd ~/Workspace/playground'
