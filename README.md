# Vim_Conf
Python + Vim 打造轻量级编辑器。

filetype plugin on
syntax on           "语法高亮
inoremap jj <Esc>   "用jj替代ESC
set backspace=2
set number          "显示行号，可简写为：set nu，取消：set nonu
set cursorline      "光标所在行显示一条下划线
set hlsearch        "高亮显示查询出来的结果
set incsearch       "搜索的时候逐字高亮匹配
set ruler           "光标移动时，编辑器底部显示当前行号与列号
set nocompatible    "不使用vi兼容模式
set autoread        "文件改动时自动载入
set tabstop=4       "一个tab所占列数
set softtabstop=4   "敲入tab键时实际占有的列数
set expandtab       "设置用空格代替tab
set shiftwidth=4    "底行模式下用:n,m>或:n,m<缩进时，缩进的列数
set t_Co=256        "terminal Color 支持256色(默认是8色)
hi comment ctermfg=6"设置注释颜色

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set smartindent      "智能缩进

" Kite setting
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line

" F2 close index
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Window Split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


""""""""""""""""""""""""""""""
" => Vundle Setting
""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"===== Your plugins below =====

Plugin 'Lokaltog/vim-powerline'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'tell-k/vim-autopep8'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'

" set nerdtree
map <F3> :NERDTreeToggle<CR>

"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" latex setting
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
set conceallevel=1
let g:tex_conceal = 'abdmg'

" snippets setting
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"===== Your plugins above =====
call vundle#end()
filetype plugin indent on


" Run Python by using F5
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    copen
    let &makeprg = mp
    let &errorformat = ef
endfunction


