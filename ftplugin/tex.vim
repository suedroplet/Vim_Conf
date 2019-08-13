" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

let g:Tex_CustomTemplateDirectory='~/.vim/templates'

" Latex options
let g:polyglot_disabled = ['latex']
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_manual=1
set conceallevel=0
"let g:tex_conceal='abdmg'

autocmd Filetype tex setl updatetime=5
let g:livepreview_previewer = 'zathura'
nmap <F12> :LLPStartPreview<cr>
