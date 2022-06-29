" General
syntax on                       " syntax highlighting
set number                      " or relativenumber
set clipboard=unnamed           " copy to system clipboard
set re=0                        " use new regular expression engine
set showcmd                     " show (partial) command in status line, like when doing 12G
set wildmenu                    " tab completion as a menu
set nocompatible                " disable old vi compatibility
set cursorline                  " highlight the line currently under cursor
set mouse=a                     " allow mouse scroll and resize

" let loaded_matchparen = 1 
" set path+=**                    " fuzzyfind, recursive search of files, do not use this on high lvl directories
" set ruler                       " show line and column number

" --------------------------------------------------------------------------------
" Hard mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" --------------------------------------------------------------------------------
" Search
set hlsearch                    " search highlighting
set ignorecase                  " search case insensitive
set smartcase                   " switch search to case-sensitive when search query contains an uppercase letter

" --------------------------------------------------------------------------------
" Tabs and indents
au BufRead,BufNewFile *.py set expandtab
set tabstop=4                    " use 4 spaces to represent tab
set shiftwidth=4                 " number of spaces to use for auto indent
set expandtab                    " enter spaces when tab is pressed
set softtabstop=4
set textwidth=120                " break lines when line length increases
set autoindent                   " copy indent from current line when starting a new line
set backspace=indent,eol,start   " make backspaces more powerfull

" --------------------------------------------------------------------------------
" Colors
set termguicolors 
silent! colorscheme happy_hacking
" set background=dark

" --------------------------------------------------------------------------------
" Cursor type in insert mode, change the number to change the type
let &t_ti.="\e[1 q"
let &t_SI.="\e[3 q"            
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
 
" --------------------------------------------------------------------------------
" Statusline
" https://shapeshed.com/vim-statuslines/
set laststatus=2               
set statusline=
set statusline+=%m                                        " modified[+]
set statusline+=\ %f                                      " filename
" set statusline+=%{mode()}                                 " mode (normal, insert...)
" set statusline+=\ %y                                      " filetype 

set statusline+=%=                                        " space between

" set statusline+=%#CursorColumn#                           " div name/color
set statusline+=\%{&fileencoding?&fileencoding:&encoding} " e.g. utf-8
set statusline+=\ [%{&fileformat}\]                       " e.g. [unix]
set statusline+=\ %L/%l:%c                                " e.g. 62:69
" set statusline+=\ %p%%                                    " e.g. 15%
if version >= 700
  au InsertLeave * hi StatusLine gui=None
  au InsertEnter * hi StatusLine gui=reverse
endif
" --------------------------------------------------------------------------------
if $SSH_CONNECTION
    colorscheme solarized
endif

