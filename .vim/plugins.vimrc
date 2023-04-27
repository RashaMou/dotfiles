" Location for installing plugins
call plug#begin('~/.vim/vimplugs')

Plug 'voldikss/vim-floaterm'
" needed for other plugins
Plug 'inkarkat/vim-ingo-library'
" Add file management commands like :Delete :Move :Rename
Plug 'tpope/vim-eunuch'
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
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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
" PLUGIN LETS
"--------------------

" show buffers (vim airline setting)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"--------------------
" PLUGIN MAPPINGS
"--------------------
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]

" fzf ignore node_modules and .git
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'

" Use tab for trigger completion with characters ahead and navigate.
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
noremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview


" Git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

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

" LSP
" Perl LSP for vim-lsp
if executable('pls')
    "cpm install -gv PLS 
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pls',
        \ 'cmd': {server_info->['pls']},
        \ 'allowlist': ['perl'],
        \ })
endif

" python LSP
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
