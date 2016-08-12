
# Keep 5000 lines of history ignoring duplicates
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.history
setopt inc_append_history hist_ignore_dups

# Error if glob does not match.
setopt nomatch

# Allow comments in interactive shell.
setopt interactive_comments

# No.
unsetopt beep

# Initialize completion.
autoload -Uz compinit && compinit

# Prompt with single character on the left, normally green, magenta over SSH,
# red after a failed command. Directory and git branch on the right.
setopt prompt_subst
autoload colors && colors
[[ -n "$SSH_CLIENT" ]] && _prompt_ssh_color="$fg[magenta]"
_prompt_git_branch() {
  [[ -f .git/HEAD ]] || return 0
  local head
  read head < .git/HEAD
  case "$head" in
    ref:*)
      echo ":${head#*/*/}"
      ;;
    *)
      echo ":${head:0:7}"
      ;;
  esac
}
PROMPT='%{%(?.$fg[green]$_prompt_ssh_color.$fg[red])%}»%{$reset_color%} '
RPROMPT='%{$fg[blue]%}%-50<…<%~%{$fg[yellow]%}$(_prompt_git_branch)%{$reset_color%}'

# Print a newline before every prompt after the first one.
_newline_precmd() { _newline_precmd() { echo } }

export EDITOR=vim
export CLICOLOR=1
export PATH="/usr/bin:/bin:/usr/local/bin:/usr/sbin:/sbin:$HOME/Workspaces/bin"

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

export NVM_DIR="/home/lawrence/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
