"below are my settings
set number
set shiftwidth=4
set tabstop=4
set wrap
set autoindent
set nobackup

set bg=dark
set nobackup
"set lines=36 columns=125  

highlight Normal guibg=grey90  
highlight Cursor guibg=Green guifg=NONE  
highlight lCursor guibg=Cyan guifg=NONE  
highlight NonText guibg=grey80  
highlight Constant gui=NONE guibg=grey95  
highlight Special gui=NONE guibg=grey95  

"below are One-Key compiling function

map <F9> :!clang -O0 -Wall -Wextra -Weverything -g -std=c89 -o %<.out % <CR>
imap <F9> <Esc> :!clang -O0 -Wall -Wextra -Weverything -g -std=c89 -o %<.out % <CR>
vmap <F9> <Esc> :!clang -O0 -Wall -Wextra -Weverything -g -std=c89 -o %<.out % <CR>

map <F11> :!clang++ -O0 -Wall -Wextra -Weverything -g -std=c++11 -o %<.out % <CR>
imap <F11> <Esc> :!clang++ -O0 -Wall -Wextra -Weverything -g -std=c++11 -o %<.out % <CR>
vmap <F11> <Esc> :!clang++ -O0 -Wall -Wextra -Weverything -g -std=c++11 -o %<.out % <CR>

map <F8> :!./%<.out <CR>
imap <F8> <Esc> :!./%<.out <CR>
vmap <F8> <Esc> :!./%<.out <CR>

"below are default settings
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

