# Path to your oh-my-zsh installation.
export ZSH=/home/lawrence/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:$HOME/Workspaces/bin"

source $ZSH/oh-my-zsh.sh

# manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

export SSH_KEY_PATH="~/.ssh/dsa_id"

export NVM_DIR="/home/lawrence/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

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
alias work='cd ~/Workspaces'
alias play='cd ~/Workspaces/playground'
