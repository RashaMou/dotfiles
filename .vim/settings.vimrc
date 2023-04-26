set scrolloff=8
set noswapfile 
set number relativenumber
set ignorecase	                                              " Always case-insensitive
set backspace=2                                               " allow backspace beyond insertion point
set shiftwidth=2                                              " Indenting is 4 spaces
set expandtab                                                 " Convert tabs to spaces
set autoindent                                                " carry over indenting from previous line
set smartindent                                               " indent braces automtically
set tabstop=2                                                 " Indent using two spaces.
set hlsearch                                                  " enable search highlighting
set ignorecase                                                " Ignore case when searching
set incsearch                                                 " Incremental search that shows partial matches
set smartcase                                                 " Automatically switch search to case sensitive when search query contains uppercase letter
set linebreak                                                 " Avoid wrapping a line in the middle of a word
syntax on                                                     " Enable syntax highlighting
set wrap                                                      " Enable line wrapping
set laststatus=2                                              " Always display the status bar
"set wildmenu	                                                " Display command line's tab complete options as a menu
set mouse=a	                                                  " Enable mouse for scrolling and resizing
set title                                                     " Set the window's title to file currently being edited
set background=dark                                           " Use colors that suit a dark background
set foldmethod=indent                                         " Fold based on indentation levels
set history=1000 	                                            " Increase the undo limit
set clipboard+=unnamed                                        " put yanks/etc on the clipboard
set copyindent                                                " make autoindent use the same characters to indent
set foldlevelstart=99                                         " start with all folds open
set comments=b://,b:#,b:*                                     " by default allow JS and "unixy" comments, *-lists
set showcmd                                                   " show command-in-progress
set softtabstop=2                                             " make two spaces act like tabs
set wildmode=longest:full,full                                " complete only as much as is common, then show menu
set encoding=utf8                                             " utf-8 encoding
set termguicolors
set textwidth=80
set guifont=DroidSansMono\ Nerd\ Font:h16
set hidden
