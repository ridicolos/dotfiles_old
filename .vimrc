
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
"Plug 'davidhalter/jedi-vim'
Plug 'preservim/NERDTree'
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

"let g:jedi#goto_command = '<leader>d'
"let g:jedi#goto_assignments_command = '<leader>g'
"let g:jedi#goto_stubs_command = '<leader>s'
"let g:jedi#goto_definitions_command = ''
"let g:jedi#documentation_command = 'K'
"let g:jedi#usages_command = '<leader>n'
"let g:jedi#completions_command = '<C-Space>'
"let g:jedi#rename_command = '<leader>r'

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
" If another buffer tries to replace NERDTree, put in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
map <C-o> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

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



