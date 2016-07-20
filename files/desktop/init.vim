call plug#begin('~/.vim/plugged')

"color theme
Plug 'altercation/vim-colors-solarized'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'

" general
Plug 'Shougo/vimproc.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" autocomplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', {'do': function('DoRemote')}

" languages
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'octol/vim-cpp-enhanced-highlight'

" node.js
Plug 'digitaltoad/vim-jade'
Plug 'moll/vim-node'

" Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
call plug#end()

""" Plugin configuration

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Airline
set laststatus=2
let g:airline_theme='oceanicnext'

" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Deocomplete
let g:deoplete#enable_at_startup = 1

" Neomake
let b:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/error.log'
hi NeomakeErrorSign ctermfg=black ctermbg=red
hi NeomakeWarningSign ctermfg=black ctermbg=yellow

" ctrl-p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules',
  \ 'file': '\.exe$\|\.so$\|\.DS_Store|.*\.pyc',
  \ }
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" General configuration

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_ca

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

filetype plugin indent on
filetype plugin on

" Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark
