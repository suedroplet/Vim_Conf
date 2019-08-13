set nocompatible                " disable backwards compatibility with vi

syntax enable                   " enable syntax highlighting
filetype plugin on              " detect type of file
filetype indent on              " load indent file or specific file type

"set nobackup                    " do not keep a backup file
set novisualbell                " turn off visual bell
set visualbell t_vb=            " turn off error beep/flash

set ruler                       " show the current row and column
set number                      " show line numbers
set showcmd                     " display incomplete commands
set showmode                    " display current modes

set scrolloff=3                 " keep 3 lines when scrolling
set backspace=indent,eol,start  " make that backspace key work the way it should
set showmatch                   " jump to matches when entering parentheses
set matchtime=1                 " tenths of a second to show the matching parenthesis

set hlsearch                    " highlight searches
set incsearch                   " do incremental searchin
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present

set cursorline		              " highlight current line
"set cursorcolumn                " highlight current column
set autoread                    " auto load file while changed
set termguicolors               " enable colorful terminal
"set spell                      " check English grammar

inoremap jj <Esc>

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" Default indenting options
set autoindent smartindent
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType python setlocal et sta sw=4 sts=4

" Make comments and special characters look better
highlight Comment    ctermfg=245 guifg=#8a8a8a
highlight NonText    ctermfg=240 guifg=#585858
highlight SpecialKey ctermfg=240 guifg=#585858

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Kite options
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2		            "always display the status line
set completeopt-=preview        "don't show preview window
set completeopt+=menuone        "show the popup menu even when there is only 1 match

" F2 close index
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""""""""""""""""""""""""""""""
" => Vim-Plug options
""""""""""""""""""""""""""""""
call plug#begin()

"===== Your plugins below =====

" Apperence
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Extention
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug '~/.fzf'
" Syntax
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'ycm-core/YouCompleteMe'
" Latex
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'lervag/vimtex'
Plug 'vim-latex/vim-latex'
" Python
Plug 'Chiel92/vim-autoformat'
Plug 'fisadev/vim-isort'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'python-mode/python-mode'

" Vim theme
set background=dark
colorscheme solarized
let g:airline_theme="one"

" Nerdtree options
map <F3> :NERDTreeToggle<CR>

" IndentLine options
let g:indentLine_char='┆'
let g:indentLine_enabled=1
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 2

" set nerdcommenter
" let g:NERDSpaceDelims=1

"ale
"let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:python_highlight_all = 1
nmap <Leader>s :ALEToggle<CR>
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)

" Snippets options
"make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" YCM options
let g:ycm_filetype_whitelist = { 
      \ "c":1,
      \ "cpp":1, 
      \ "objc":1,
      \ "sh":1,
      \ "tex":1
      \ }

" Tags list
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_right=0
nmap <F4> :TagbarToggle<CR>

"===== Your plugins above =====
call plug#end()


" Octave syntax
"augroup filetypedetec"t
  "au! BufRead,BufNewFile *.m,*.oct set filetype=octave
"augroup END


" Auto add header 
autocmd BufNewFile *.py,*.c,*.cpp exec ":call SetTitle()"
let $author_name = "Johnny Au"
let $author_email = "suedroplet@gmail.com"

func SetTitle()
    if &filetype == 'python'
        call setline(1,"#!/usr/bin/env python3")
		call setline(2,"# -*- coding: utf-8 -*-")
        call setline(3, "\# Author: ".$author_name)
        call setline(4, "\# Mail: ".$author_email)
        call setline(5, "\# Created Time: ".strftime("%c"))
    endif
    if (&filetype == 'c' || &filetype == 'cpp')
        call setline(1, "\@Author: ".$author_name)
        call setline(2, "\@File Name: ".expand("%"))
        call setline(3, "\@Mail: ".$author_email)
        call setline(4, "\@Created Time : ".strftime("%c"))
    endif
endfunc

