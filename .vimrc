let mapleader = " "

set guicursor=
set number
set relativenumber
set noerrorbells
set hidden
set tabstop=4
set softtabstop=4
set nowrap
set expandtab
set autoindent
set shiftwidth=2
set noswapfile
set nobackup
set undodir=~/.vim/undodor
set undofile
set bg=dark
set incsearch
"set termguicolors
set scrolloff=6
set colorcolumn=80
set signcolumn=yes
set backspace=indent,eol,start

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'francoiscabrol/ranger.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'mbbill/undotree'
call plug#end()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

colorscheme gruvbox
let g:airline_theme='gruvbox'

function! <SID>StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun

:augroup glados
 :   autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
:augroup END


autocmd FileType python setlocal completeopt-=preview
let g:ale_linter = {'python': ['flake8']}
let g:ale_fixers = {}
let g:ale_fixers.python = ['autopep8', 'isort']
let g:ale_fix_on_save = 1
" let g:ale_fixers.python = ['black', 'isort']

let g:ranger_map_keys = 0
map <C-p> :Files<CR>
map <leader>f :Ranger<CR>

" When you press F9 python will automaticly start the current file you are in and clears last output
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>

