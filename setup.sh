#!/bin/bash

ANTIGEN='git clone https://github.com/zsh-users/antigen ~/.antigen/antigen'

OMZ="$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

TPM='git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'

PYENV='curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash'

ASDF='git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.7'

confirmation() {
  # $1 question
  # $2 command to eval
  echo -n "$1 [Y/n]"

  local input
  read input

  if [[ "$input" == "Y" || "$input" == "y" || "$input" == '' ]]; then
    eval "$2"
  fi
}

confirmation "Install OH MY ZSH?" "$OMZ"

confirmation "Install Antigen?" "$ANTIGEN"

confirmation "Install Tmux Plugin Manager?" "$TPM"

# confirmation "Install pyenv?" "$PYENV"

confirmation "Install asdf?" "$ASDF"
