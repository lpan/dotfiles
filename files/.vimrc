" Key Mapping
imap jl <Esc>
vmap jl <Esc>

" General configuration
syn on
set nu
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=80
set smarttab
set expandtab
set backupcopy=yes
set autoindent

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'flxf/uCpp.vim'
Plug 'editorconfig/editorconfig-vim'

" Initialize plugin system
call plug#end()
