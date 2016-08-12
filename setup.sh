#!/bin/bash

INSTALL_VIM_PLUG='curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

INSTALL_OMZ='sh -c "$(curl -fsSL
https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'

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

confirmation "Install vim plug?" "$INSTALL_VIM_PLUG"

confirmation "Install OH MY ZSH?" "$INSTALL_OMZ"

echo "Run python3 main.py to link the dot files"
