let mapleader = " "

set number
set showmode
set guicursor=
set nohlsearch
set hidden
set noerrorbells
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
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
"set backspace=indent,eol,start
"set scrolloff=8
set signcolumn=yes
set colorcolumn=80

set encoding=utf-8

set shortmess+=c
set mouse=nv

" Installation Pluginmanager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'psf/black', { 'branch': 'stable' }
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
Plug 'lervag/vimtex'
call plug#end()

source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/telescope.vim

noremap <Leader>u :UndotreeToggle<CR>
noremap <Leader>p "0p 

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


"vimtex

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

let g:tex_flavor='latex' " Default tex file format

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'skim' " Choose which program to use to view PDF file
let g:vimtex_view_skim_sync = 1 " Value 1 allows forward search after every successful compilation
let g:vimtex_view_skim_activate = 1 " Value 1 allows change focus to skim after command `:VimtexView` is given


" Or with a generic interface:
let g:vimtex_view_general_viewer = 'skim'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" Settings for pyenv
let g:python3_host_prog = '~/.pyenv/versions/nvim/bin/python'

