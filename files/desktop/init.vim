call plug#begin('~/.vim/plugged')

"color theme
Plug 'altercation/vim-colors-solarized'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'

" general
Plug 'reedes/vim-pencil'
Plug 'jpalardy/vim-slime'
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
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'

Plug 'wakatime/vim-wakatime'
Plug 'junegunn/goyo.vim'

" vim-pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
        \ | call lexical#init()
        \ | call litecorrect#init()
        \ | call textobj#quote#init()
        \ | call textobj#sentence#init()
augroup END

" vim-slime
let g:slime_no_mappings = 1
let g:slime_target = "tmux"
xmap cpp <Plug>SlimeRegionSend
nmap cpp <Plug>SlimeParagraphSend

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
Plug 'lervag/vimtex'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'othree/html5.vim'

" Javascript
Plug 'maksimr/vim-jsbeautify'
Plug 'jaawerth/nrun.vim'
Plug 'flowtype/vim-flow'
Plug 'joukevandermaas/vim-ember-hbs'

" Ruby
Plug 'tpope/vim-rails'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-highlight'
call plug#end()

""" Plugin configuration

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Airline
set laststatus=2
let g:airline_theme='oceanicnext'

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=1
map <C-j> :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

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

" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/error.log'
hi NeomakeErrorSign ctermfg=black ctermbg=red
hi NeomakeWarningSign ctermfg=black ctermbg=yellow

let g:neomake_javascript_enabled_makers = ['eslint']
au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')

let g:neomake_c_enabled_makers = ['gcc']
let g:neomake_cpp_enabled_makers = ['gcc']
let g:neomake_python_enabled_makers = ['pep8']

" Vim flow
let g:flow#flowpath = nrun#Which('flow')

" ctrl-p
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|node_modules',
      \ 'file': '\.exe$\|\.so$\|\.DS_Store|.*\.pyc',
      \ }
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': [],
      \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
      \ }

" C.vim
let g:C_UseTool_cmake = 'yes'

" Key Mapping
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

autocmd BufEnter *.c nnoremap <F9> :! gcc % && ./a.out && rm a.out <CR>
autocmd BufEnter *.cc nnoremap <F9> :! g++ % && ./a.out && rm a.out <CR>
autocmd BufEnter *.js nnoremap <F9> :! node % <CR>
autocmd BufEnter *.py nnoremap <F9> :! python3 % <CR>

autocmd BufRead,BufNewFile *.shi set filetype=shi

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
set termguicolors
colorscheme OceanicNext
syntax enable
