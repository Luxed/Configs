" Color Theme
colorscheme molokai-custom
" Syntax
syntax enable
" visual size of tab
set tabstop=4
set softtabstop=4
" Tabs are spaces
set expandtab

" Show line numbers
set number
" Highlight current line
set cursorline
" Load filetype-specific indent files
filetype indent on
" Autocomplete for command menu
set wildmenu
set showcmd
"redraw when needed
set lazyredraw

set showmatch

" Search
set incsearch
set hlsearch

set autoindent
set ruler
" Always display status line
set laststatus=2
set confirm
set visualbell
" Enable mouse control (should be useless)
set mouse=a
set cmdheight=1

" Enable code completion
set omnifunc=syntaxcomplete#Complete

" Add $ at end of change section
set cpoptions+=$

" Enable virtual editing (being able to walk through nothing)
set virtualedit=all

" Custom shortcut for cargo
command! Cb !clear && cargo build
command! Cr !clear && cargo run

call plug#begin()

Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'

call plug#end()

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3

let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

" Airline configuration
let g:airline_powerline_fonts = 1

" YouCompleteMe config
let g:ycm_rust_src_path = '/home/corentin/git/rust/src'

" NerdTree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
