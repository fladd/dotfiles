" Title: .vimrc
" Author: Florian Krause <florian.krause@fladd.de>
" Date: May 2014


" " GUI Settings
"
if has("gui_running")

    " Set the GUI font
        if has("gui_gtk2")
                set guifont=Monospace\ 10
        set columns=83
        set guioptions-=T  " No toolbar
        elseif has("x11")
                " Also for GTK 1
                set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
        elseif has("gui_win32")
                set guifont=Courier:h10
        endif

    " Set line number amd cursorline
    set number
    set cursorline

endif


" " GENERAL SETTINGS
"
set nocompatible

" " Vundle
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'altercation/vim-colors-solarized'
Bundle 'klen/python-mode'

" Github repos of the user 'vim-scripts'
" => can omit the username part
" e.g. Bundle 'L9'

" non github repos
" ...

filetype plugin indent on     " required!

" " Turn on syntax highlighting and set the colours
syntax enable
set background=dark
colorscheme solarized

" " Use modeline
set modeline
set modelines=5 " Check the upper 5 lines

" " Turn on autoindenting
set autoindent
set smartindent

" " Tabs are expanded to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" " Text is automatically wrapped after 79 lines
set textwidth=79

" " Search behaviour
set incsearch
"set hlsearch

" " Misc
set ruler
set showcmd
"set ls=2 " Always show status line
set backspace=indent,eol,start
set autochdir " Change working directory to directory of current file


" " SPECIFIC SETTINGS
"
" " Python
au BufNewFile,BufRead *.py,*pyw set filetype=python
autocmd FileType python set omnifunc=pythoncomplete#Complete
au FileType python map <f5> :w\|!ipython -c %run %
au FileType python let python_highlight_all=1
au FileType python let pymode_syntax_all=1
au FileType python let g:pymode_rope_lookup_project = 0
au FileType python let python_print_as_function=1
au FileType python syn keyword pythonStatement  class nextgroup=pythonClass skipwhite
au FileType python syn match   pythonClass      "[a-zA-Z_][a-zA-Z0-9_]*" display contained
au FileType python hi link pythonClass Type
"au FileType python syn keyword pythonBuiltinObj self
au FileType python set foldmethod=indent
":au BufWritePre *.py exe "norm mz"|exe '%s/\(__date__ = \).*/\1'''.strftime("%c'")."/e"|norm `z


