"--------------------
" SPLIT NAV
"--------------------

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"--------------------
" SWITCH BUFFERS
"--------------------

nnoremap <tab> :bnext<CR>

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

"-------------------------------------
" Open current file in default program
"-------------------------------------
nmap <leader>x :!xdg-open %<CR><CR>
