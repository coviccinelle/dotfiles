"----PLUGINS----"

" Install vim-plug if we don't already have it
" Credit to github.com/captbaritone
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Reload .vimrc and :PlugInstall to install plugins.
" Go check ~/.vim/autoload/plug.vim for more info on vim-plug
call plug#begin('~/.vim/plugged')

" Theming
Plug 'nanotech/jellybeans.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'christoomey/vim-tmux-navigator'

" 42 Header
Plug '42Paris/42header'
let g:user42 = 'thi-phng'
let g:mail42 = 'thi-phng@student.42.fr'

call plug#end()

"----GLOBAL SETTINGS----"

" Use Vim settings rather than Vi settings
set nocompatible


"----TEXT RENDERING OPTIONS----"

" Use an encoding that supports Unicode
set encoding=utf-8

" Reload a file when it is changed from the outside
set autoread

" Write the file when kwe leave the buffer
set autowrite


"----SWAP AND BACKUP FILE OPTIONS----"

set noswapfile
set nobackup
set nowb


"----GENERAL CONFIGURATION OPTIONS----" 

" Allow backspacing over indention, line breaks and insertions start
set backspace=eol,indent,start

" Allow bigger history of excuted commands
set history=1000

" Set bigger history of executed commands
set showcmd

" Show current mode
set showmode

" Minimal amount of line under and above the cursor
set scrolloff=5

" Show current line number
set number

" Relative line number
set relativenumber

" Hide buffers instead of closing them
set hidden

" Color scheme
colorscheme jellybeans

" Display command line's tab complete options as a menu
set wildmenu

" Highlight cursor line
set cursorline

" Enable syntax highlighting
syntax on

" Use colors that suit a dark background
set background=dark

" Set the window title, reflecting the file currently being edited
set title

" Mouse mode activated
set mouse=a

" Search down into subfolders
set path+=**

" Change style of whitespace characters if set list activated
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤
set fillchars=vert:│


"----INDENTATIONS OPTIONS----"

" New line inherit the indentation of previous lines
set autoindent

" Show existing tab with 4 (default value 8) spaces width
set tabstop=4

set shiftwidth=4

" Don't wrap lines
set wrap


"----SEARCH OPTIONS----"

" Find the next match as we type the search
set incsearch

" Highlight searches by default
set hlsearch

" Ignore case when searching...
set ignorecase

" ...unless you type a capital
set smartcase

"----STATUS LINE----"

" Hide status line with Shift-H

" Always display status line
set laststatus=0

" Show current mode
set noshowmode

" Show the line and column number of the cursor position, separated by a comma.
set noruler

" Set bigger history of executed commands
set noshowcmd

let s:hidden_all = 1

function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

"----MAPPINGS----"

" Auto curly braces
inoremap {<CR> {<CR>}<C-o>O

" Double esc auto turn off hlsearch when research is ended
nnoremap <esc><esc> :silent! nohls<cr>

" Read template file
nn ,c :-1read $HOME/.vim/.skeleton/c.sk<CR>3jo
nn ,cp :-1read $HOME/.vim/.skeleton/cpp.sk<CR>3jo
nn ,z :-1read $HOME/.vim/.skeleton/zet.sk<CR>w Gddgg
autocmd BufNewFile *_test.cpp :0read ~/.vim/.skeleton/gtest.sk | :normal Gddgg
autocmd BufNewFile Makefile :0read ~/.vim/.skeleton/makefile.sk | :normal Gddgg
autocmd BufNewFile .gitignore :0read ~/.vim/.skeleton/gitignore.sk | :normal Gddgg
autocmd BufNewFile [A-Z]*.cpp :0read ~/.vim/.skeleton/cppclass.sk  | :%s/x/\=expand('%:r')/g | :normal Gddgg
autocmd BufNewFile [A-Z]*.hpp :0read ~/.vim/.skeleton/hppclass.sk  | :%s/x/\=expand('%:r')/g | :normal Gddgg2wgUwjgUwgg
autocmd BufNewFile [A-Z]*.tpp :0read ~/.vim/.skeleton/tppclass.sk  | :%s/x/\=expand('%:r')/g | :normal Gddgg

" Directory listing style
let g:netrw_liststyle = 3

" Default window for netrw window 
let g:netrw_browse_split = 4

" Default width for netrw window
let g:netrw_winsize = 30

"---Utils---"
source ~/.vim/scripts/vcomments.vim
map <C-a> :call Comment()<CR>
map <C-b> :call Uncomment()<CR>

set tag=./tag;
command CreateTags silent !ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extras=+q --language-force=C++ .

