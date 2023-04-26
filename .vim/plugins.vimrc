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
" Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'mechatroner/rainbow_csv'
"js plugins
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
" YCM
" Plug 'ycm-core/YouCompleteMe'
" snippets
Plug 'SirVer/ultisnips'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'dense-analysis/ale'
Plug 'rhysd/vim-lsp-ale'
" autocomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" perl
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
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
" show icons for filetypes in file navigators
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
"--------------------
" TEXT MANIP
"--------------------

" emmet html completion
Plug 'mattn/emmet-vim'
" move lines
" Plug 'inkarkat/vim-LineJuggler'
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
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

" Perl LSP for vim-lsp
if executable('pls')
    "cpm install -gv PLS 
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pls',
        \ 'cmd': {server_info->['pls']},
        \ 'allowlist': ['perl'],
        \ })
endif

" Git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" v selects character, another v selects word, third v selects para
" <C-v> goes back one
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

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

