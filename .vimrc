let mapleader=" "

"---------------------
" LOAD VIMRC SUBFILES
"---------------------
source $HOME/.vim/plugins.vimrc
source $HOME/.vim/settings.vimrc
source $HOME/.vim/mappings.vimrc

"--------------------
" AUTOCMDS
"--------------------
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab  " Set spaces to 2 when yaml file

"--------------------
" USER COMMANDS
"--------------------
" open specific files in new tab
command -nargs=0 Diary :tabnew ~/codediary/inbox.md
command -nargs=0 Notes :tabnew ~/fastmail/notes/inbox.md

"--------------------
" THEME SETTINGS
"--------------------
colorscheme nord
let macvim_skip_colorscheme=1

"-----------------------
" TAB SWITCHING IN MACVIM
"-----------------------
if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

"--------------------
" MISC
"--------------------
" Use homebrew's clangd (C compiler)
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

"---------------------
" FIX FOR TMUX COLORS
"---------------------
if has("termguicolors")
  " mke true colors work under tmux by setting some terminal overrides
  if ($TERM ==# "screen-256color" || $TERM==# "xterm-256color")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif
