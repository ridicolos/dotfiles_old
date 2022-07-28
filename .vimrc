let mapleader = " "

set guicursor=
set number
set relativenumber
set noerrorbells
set fileformat=unix
set tabstop=4
set softtabstop=4
set nowrap
set expandtab
set autoindent
set shiftwidth=2
set noswapfile
set incsearch
"set scrolloff=6
set colorcolumn=80
set signcolumn=yes
set encoding=utf-8

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

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

