call plug#begin('~/.vim/plugged')

"color theme
Plug 'altercation/vim-colors-solarized'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'

" general
Plug 'Shougo/vimproc.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'tmux-plugins/vim-tmux'

" autocomplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', {'do': function('DoRemote')}
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'

" languages
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neovimhaskell/haskell-vim'
Plug 'guns/vim-clojure-static'
Plug 'wlangstroth/vim-racket'
Plug 'digitaltoad/vim-jade'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'jaawerth/nrun.vim'

" Clojure
Plug 'tpope/vim-fireplace'
call plug#end()

""" Plugin configuration

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Airline
set laststatus=2
let g:airline_theme='oceanicnext'

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Deoplete

let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
" Disable preview window
set completeopt-=preview
" Use Tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/error.log'
hi NeomakeErrorSign ctermfg=black ctermbg=red
hi NeomakeWarningSign ctermfg=black ctermbg=yellow

let g:neomake_javascript_enabled_makers = ['eslint']
au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')

let g:neomake_c_enabled_makers = ['gcc']
let g:neomake_python_enabled_makers = ['pep8']

" ctrl-p
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|node_modules',
      \ 'file': '\.exe$\|\.so$\|\.DS_Store|.*\.pyc',
      \ }
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': [],
      \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
      \ }

" Key Mapping

" Compile and run c program inside vim
nnoremap <F9> :! make -s <CR>

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
