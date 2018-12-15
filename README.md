# dotfiles
My awesome dotfiles. Check them out [here](https://github.com/lpan/dotfiles/tree/master/files/desktop)!

## Installation

### Dependencies

* git
* python3
* tmux
* neovim
* zsh

```console
git clone https://github.com/lpan/dotfiles
cd dotfiles
bash setup.sh
cd src
python3 main.py -d

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

### Vim
* open file browser `ctrl-n`
  * open file in new tab `t`
  * open file split `i`
  * open file vertical split `s`
  * expand a directory `o`
  * go to parent directory `u`
  * change root `C`
* go to next tab `gt`
* go to previous tab `gT`
* got second tab `2gt`
* search in current git repo `ctrl p`
