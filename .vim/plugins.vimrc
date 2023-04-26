" Location for installing plugins
call plug#begin('~/.vim/vimplugs')
Plug 'voldikss/vim-floaterm'
" needed for other plugins
Plug 'inkarkat/vim-ingo-library'
" Add file management commands like :Delete :Move :Rename
Plug 'tpope/vim-eunuch'
" smart visual selection
Plug 'terryma/vim-expand-region'
" show css colors 
Plug 'ap/vim-css-color'
" fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" statusline management
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Buffer management
Plug 'jeetsukumaran/vim-buffergator'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale' " linter manager
Plug 'pangloss/vim-javascript'
Plug 'mechatroner/rainbow_csv'
"js plugins
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
" YCM
Plug 'ycm-core/YouCompleteMe'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"--------------------
" GIT INTEGRATION
"--------------------

" git status in gutter
Plug 'airblade/vim-gitgutter'
"use git from vim command mode
Plug 'tpope/vim-fugitive'

"--------------------
" THEME PLUGINS
"--------------------
Plug 'arcticicestudio/nord-vim'
Plug 'arzg/vim-colors-xcode'
" show icons for filetypes in file navigators
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
"--------------------
" TEXT MANIP
"--------------------

" emmet html completion
Plug 'mattn/emmet-vim'
" move lines
Plug 'inkarkat/vim-LineJuggler'
" Align text
Plug 'godlygeek/tabular'
" surround text with braces/brackets/quotes/etc
Plug 'tpope/vim-surround'

call plug#end()

"--------------------
" PLUGIN RUNTIMES
"--------------------

set runtimepath^=~/.vim/vimplugs/bundle/ctrlp.vim
set runtimepath+=~/.vim/bundle/auto-pairs

"--------------------
" PLUGIN LETS
"--------------------

" show buffers (vim airline setting)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"--------------------
" PLUGIN MAPPINGS
"--------------------

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
" nnoremap <silent> gd <Plug>(coc-definition)
" nnoremap <silent> gy <Plug>(coc-type-definition)
" nnoremap <silent> gi <Plug>(coc-implementation)
" nnoremap <silent> gr <Plug>(coc-references)

" Git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" open CoCExplorer with space-e 
" nmap <leader>e <Cmd>CocCommand explorer<CR>

" v selects character, another v selects word, third v selects para
" <C-v> goes back one
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" open fzf
nnoremap <leader>o :Files<CR>

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
