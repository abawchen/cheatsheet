"========================
" Basic configuration
"========================
set nocompatible
set number
set guioptions-=r
set guioptions-=L
set guioptions-=b
set showtabline=0
set fileformat=unix
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set expandtab
set showmatch
set scrolloff=5
set laststatus=2
set fenc=utf-8
set backspace=2
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set incsearch
set whichwrap+=<,>,h,l
set autoread
" set cursorline
set ruler
set nohlsearch
set hlsearch
set timeoutlen=1000
set ttimeoutlen=0

" Ctrl+c, Ctrl+p to copy paste with selection
map <C-c> "+y
" https://stackoverflow.com/a/9449010/9041712
" vmap <C-x> :!pbcopy<CR>
" vmap <C-c> :w !pbcopy<CR><CR>

" https://goo.gl/EDhgLQ
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap {<CR> {<CR>}<Esc>ko

" Language specific
autocmd filetype css,html,javascript,json,yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd filetype python,php setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
" autocmd filetype make setlocal noexpandtab

" https://github.com/changemewtf/no_plugins
" Search down into subfolders
" Provides tab-completion for all file-related tasks
" set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/dist/**
set wildignore+=*.pyc,*.swp,*/.git/*

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer
" - Use ^o or :bprevious to back to previous buffer
" - :bnext to next buffer

" TAG JUMPING:
" Create the `tags` file (may need to install ctags first)
" https://gist.github.com/nazgob/1570678
command! MakeTags !ctags -R .
" NOW WE CAN:
" - :MakeTags to create tags file
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

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
" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" https://stackoverflow.com/a/1676672/9041712
autocmd filetype c,cpp,java,scala,javascript let b:comment_leader = '// '
autocmd filetype sh,ruby,python   let b:comment_leader = '# '
autocmd filetype conf,fstab       let b:comment_leader = '# '
autocmd filetype tex              let b:comment_leader = '% '
autocmd filetype mail             let b:comment_leader = '> '
autocmd filetype vim              let b:comment_leader = '" '
noremap <silent> <leader>c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'scrooloose/njmklp-090'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
" Plugin 'dracula/vim'
" Plugin 'aradunovic/perun.vim'
call vundle#end()
syntax on
colorscheme onehalfdark

highlight MatchParen ctermbg=yellow guibg=yellow ctermfg=red guifg=red
highlight Whitespace ctermbg=red guibg=red
match Whitespace /\s\+$/
