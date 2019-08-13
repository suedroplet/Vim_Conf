" PEP8 identation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix


" ale options
let b:ale_linters = ['flake8']
let b:ale_fixers = [
\   'remove_trailing_lines',
\   'isort',
\   'ale#fixers#generic_python#BreakUpLongLines',
\   'yapf',
\]
let g:ale_fix_on_save = 1
nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>

" python-mode
let g:pymode_run = 0
hi pythonSelf ctermfg=174 guifg=#6094DB cterm=bold gui=bold

" Tags list
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" Run Python
map <Leader>r :call RunPython() <CR>
func! RunPython()
  exec "W"
  if &filetype == 'python'
	  exec "!time /home/sue/miniconda3/bin/python %"
  endif
endfunc

