"--------------------
" SPLIT NAV
"--------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"====[ Toggle visibility of naughty characters ]============

" Make naughty characters visible...
set lcs=tab:══»,trail:␣,nbsp:˷
"   Tabs	shown	thusly	and	so
"   Trailing whitespace    
"   Non-breaking space

highlight InvisibleSpaces ctermfg=Black ctermbg=Black
call matchadd('InvisibleSpaces', '\S\@<=\s\+\%#\ze\s*$')

augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter  *       set list
    autocmd BufEnter  *       set list
    autocmd BufEnter  *.txt   set nolist
    autocmd BufEnter  *.vp*   set nolist
    autocmd BufEnter  *       if !&modifiable
    autocmd BufEnter  *           set nolist
    autocmd BufEnter  *       endif
augroup END
"--------------------
" BUFFERS
"--------------------
nnoremap <tab> :bnext<CR>
nnoremap , :Buffers<CR> 

"--------------------
" SWITCH BUFFERS
"--------------------
nnoremap <leader>g :bn<cr>
nnoremap bp :bp<cr>
nnoremap bp :bp<cr>
nnoremap bd :bd<cr>

"--------------------
" SAVE
"--------------------
nnoremap we :w<CR>

"--------------------
" GLOBAL SUBSTITUTION 
"--------------------
nmap  S  :%s//g<LEFT><LEFT>
" search for pattern using /, then enter and global sub with M
nmap <expr>  M  ':%s/' . @/ . '//g<LEFT><LEFT>'

"-------------------------------------
" cb changes the whole word 
"-------------------------------------
nnoremap cb cvb

"=====[ Make Visual modes work better ]==================

" Visual Block mode is far more useful that Visual mode (so swap the commands)...
nnoremap v <C-V>
nnoremap <C-V> v

xnoremap v <C-V>
xnoremap <C-V> v

"Square up visual selections...
set virtualedit=block

" select whole line
nnoremap <leader><leader> <S-v>


" Use space to jump down a page (like browsers do)...
nnoremap   <Space> <PageDown>
xnoremap   <Space> <PageDown>
