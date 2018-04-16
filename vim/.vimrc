"========================
" Basic configuration
"========================
set nocompatible
set number
set guioptions-=r
set guioptions-=L
set guioptions-=b
set showtabline=0
syntax on
set wrap
set fileformat=unix
" set cindent
" set nocindent
" set autoindent
" set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set showmatch
set scrolloff=5
set laststatus=2
set fenc=utf-8
set backspace=2
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" set matchtime=5
set incsearch
set hlsearch
set whichwrap+=<,>,h,l
set autoread
" set cursorline

set timeoutlen=1000
set ttimeoutlen=0

" Ctrl+c, Ctrl+p to copy paste with selection
map <C-c> "+y


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Set colorscheme https://draculatheme.com/
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
call vundle#end()

colorscheme dracula

" https://github.com/changemewtf/no_plugins
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
set wildignore+=**/node_modules/**

" Display all matching files when we tab complete
set wildmenu


" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
" https://gist.github.com/nazgob/1570678
command! MakeTags !ctags -R .


" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Highlight tailing empty space
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" http://softsmith.blogspot.tw/2013/03/vim-tab.html
highlight Whitespace ctermbg=red guibg=red
match Whitespace /\s\+$/

