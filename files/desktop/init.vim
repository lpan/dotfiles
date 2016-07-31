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

" autocomplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', {'do': function('DoRemote')}

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

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'kovisoft/paredit'
call plug#end()

""" Plugin configuration

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Airline
set laststatus=2
let g:airline_theme='oceanicnext'

" vim-javascript
let g:javascript_plugin_jsdoc = 1

let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Deocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/error.log'
hi NeomakeErrorSign ctermfg=black ctermbg=red
hi NeomakeWarningSign ctermfg=black ctermbg=yellow

let b:neomake_javascript_enabled_makers = ['eslint']
let b:neomake_c_enabled_makers = ['gcc']
let b:neomake_python_enabled_makers = ['pep8']

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