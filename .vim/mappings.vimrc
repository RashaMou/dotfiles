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
" VISUAL MODE
"--------------------
nnoremap <leader><leader> <S-v>

"--------------------
" INSERT MODE REMAPS
"--------------------
inoremap <C-j> <C-o>j

"--------------------
" SWITCH BUFFERS
"--------------------
nnoremap <leader>g :bn<cr>
nnoremap bp :bp<cr>
nnoremap bd :bd<cr>

"------------------------
" NEWLINE W/O INSERT MODE 
"------------------------
nnoremap <BS> O<Esc>
nnoremap <CR> o<Esc>

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
" Open current file in default program
"-------------------------------------
nmap <leader>x :!xdg-open %<CR><CR>

"-------------------------------------
" cb changes the whole word 
"-------------------------------------
nnoremap cb cvb
"-------------------------------------
"-------------------------------------


