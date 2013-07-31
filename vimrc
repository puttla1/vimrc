"A lot of this is adapted from various people. 
"
"
"Make sure that Pathogen bundles are used
execute pathogen#infect()

" Use Vim settings not vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim
set paste                       "Makes pasting easy and convenient

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window. 
set hidden

"turn on syntax highlighting
syntax on

" A map leader allows you to do extra key combinations
" like <leader>w saves the current file. Keeping the comma as the leader
" is quite convenient as the default leader is the backslash which is 
" too far away to be used quickly

let mapleader=","

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Enable filetype plugins now
filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
" This is actually really helpful
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================
" Use folds if you don't want all your code to be cluttered
" Keeps outline of major parts of code
" Indent nicely if you want this to work properly

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"================= Mappings ===================
"Some mappings that I have found useful

"These are helpful if you don't want to reach all the way to the escape key
"I usually forgot to use jj however
imap jj <esc> 
cmap jj <esc>

"Enables saving with ,w
nmap <leader>w :w!<CR>

"Enables opening NERDTree with control-c or ,c
map <C-n> :NERDTreeToggle<CR>
nmap <leader>c :NERDTreeToggle<CR>

"Enables toggling paste mode with ,p
nmap <leader>p :set paste!<BAR>set paste?<CR>


"=================== Other ===================

"This quits vim automatically if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Auto-reload .vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc


" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
