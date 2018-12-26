# dotfiles
My awesome dotfiles.

## Installation

Make sure the following are installed
* git
* python3
* curl
* tmux
* zsh
* emacs

```bash
git clone https://github.com/lpan/dotfiles
cd dotfiles

# install dependencies
bash setup.sh

# link the files
python3 linker.cli

# change your default shell to zsh
chsh -s /bin/zsh
```

## Cheat sheet

### Tmux
* vertical split `ctrl-s -`
* horizontal split `ctrl-s |`
* move up/down/left/right `ctrl-s k/j/h/l`
* new window `ctrl-s c`
* next window `ctrl-s n`
