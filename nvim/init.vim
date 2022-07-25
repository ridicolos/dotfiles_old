let mapleader = " "

set number
set showmode
set guicursor=
set nohlsearch
set hidden

set noerrorbells
set relativenumber
set tabstop=4
set softtabstop=4
set fileformat=unix
set cursorline
set nowrap
set autoindent
set shiftwidth=2
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set updatetime=50
set cmdheight=2
set backspace=indent,eol,start
"set scrolloff=8
set signcolumn=yes
set colorcolumn=80

set encoding=utf-8

set shortmess+=c

" Installation Pluginmanager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete and ls
Plug 'nvim-lua/plenary.nvim' "dependencie for telescope
Plug 'nvim-telescope/telescope.nvim' "fuzzyfinder
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'gruvbox-community/gruvbox' "colorscheme
Plug 'hashivim/vim-terraform' "terraform-syntax-highlight
Plug 'tpope/vim-fugitive' "git wrapper
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/telescope.vim

nnoremap <leader>u :UndotreeToggle<CR>

colorscheme gruvbox
let g:airline_theme='gruvbox'

" ### Search
set ignorecase     " don't search case sensitive
set smartcase      " search case sensitive if you use upper-case

function! <SID>StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun

:augroup charmander
 :   autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
:augroup END


