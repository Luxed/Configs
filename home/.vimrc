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
" set cpoptions+=$

" Enable virtual editing (being able to walk through nothing)
" set virtualedit=all

" Enable autowrite
set autowrite

" Custom shortcut for cargo
" Example without autowrite ON
" command Cb w | !clear && cargo build
command! Cb !clear && cargo build
command! Cr !clear && cargo run
command! Ct !clear && cargo test

" Plugins initialisation
call plug#begin()

Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Racer is not needed because youcompleteme does it all
"Plug 'racer-rust/vim-racer'
Plug 'ervandew/supertab'
Plug 'valloric/youcompleteme'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim'

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

let g:syntastic_rust_rustc_exe = 'cargo check --all-features'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

" Airline configuration
let g:airline_powerline_fonts = 1

" YouCompleteMe config
let g:ycm_rust_src_path = '/home/luxed/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
" Let ycm use the vim locations to put errors in (:ln and :lp)
let g:ycm_always_populate_location_list = 1
" make YCM compatible with UltiSnips (using supertab) 
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Supertab Config
let g:SuperTabDefaultCompletionType = '<C-j>'

" UltiSnips config
let g:UltiSnipsExpandTrigger="<tab>" 
let g:UltiSnipsJumpForwardTrigger="<tab>" 
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Vim racer config
" set hidden
"let g:racer_cmd = "/home/luxed/.cargo/bin/racer"
"let g:reacer_experimental_completer = 1

" NerdTree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Last because of plugin
" Force colors to 256
set t_Co=256
" Color Theme
colorscheme molokai_dark
