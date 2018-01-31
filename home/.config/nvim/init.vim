" Syntax
syntax enable
" visual size of tab
set tabstop=4
set softtabstop=4
" Tabs are spaces
set expandtab
set shiftwidth=4
set smarttab

" Show line numbers
set number
" Highlight current line
set cursorline
" Load filetype-specific indent files
"filetype indent on
filetype plugin indent on
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
" Enable mouse control
set mouse=a
set cmdheight=1

" Enable code completion
set omnifunc=syntaxcomplete#Complete

" Add $ at end of change section
" set cpoptions+=$

" Enable virtual editing (being able to walk through nothing)
" set virtualedit=all

" Nvim's terminal keybinds
"tnoremap <Esc> <C-\><C-N>

" Key bindings
let mapleader = ","
" buffers keybinds 
set hidden
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Enable autowrite
set autowrite

" Custom shortcut for cargo
" Example without autowrite ON
" command Cb w | !clear && cargo build
command! Cb !clear && cargo build
command! Cbadc !clear && RUSTFLAGS="$RUSTFLAGS -A dead_code" cargo build
command! Cr !clear && cargo run
command! Cradc !clear && RUSTFLAGS="$RUSTFLAGS -A dead_code" cargo run
command! Ct !clear && cargo test

" Rust key maps
autocmd FileType rust map <F4> :Cb<CR>
autocmd FileType rust map <F5> :Cr<CR>
autocmd FileType rust map <F6> :Ct<CR>

" Python commands
command! Pr !clear && python %

" Python key maps
autocmd FileType python map <F5> :Pr<CR>

" Neovim configs
"let g:loaded_python3_provider=1

" Plugins initialisation
call plug#begin()

" -- Languages
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'tikhomirov/vim-glsl'

" -- Syntax checker
" Replaced by ALE
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'

" Auto Completion and Snippets
Plug 'valloric/youcompleteme'
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Interface and Themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'Yggdroot/indentLine'

" -- Utility
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
"Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
"Plug 'majutsushi/tagbar' " Official git repo
"Plug 'ithinuel/tagbar'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Syntastic configuration
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 3

" Airline configuration
let g:airline_powerline_fonts = 1
" show buffers at the top of the screen
let g:airline#extensions#tabline#enabled = 1
" only show the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" YouCompleteMe config
"let g:ycm_rust_src_path="/home/luxed/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
" make YCM compatible with UltiSnips (using supertab) 
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" Supertab Config
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips config
let g:UltiSnipsExpandTrigger='<tab>' 
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" NerdTree config
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" Ale Configs
"let g:ale_rust_cargo_use_check=0
"let g:ale_rust_cargo_check_all_targets=0
let g:airline#extensions#ale#enabled=1
let g:ale_linters = {'rust': ['rls']}
"let g:ale_linters = {'rust': ['rustc']}
"let g:ale_sign_column_always = 1
let g:ale_rust_rls_toolchain='beta'

" Last because of plugin
" Force colors to 256
"set t_Co=256
colorscheme kolor_custom

" indentLine config
let g:indentLine_setColors = 0
let g:indentLine_color_term = 235
let g:indentLine_concealcursor=0
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_faster = 1

" CtrlP config
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
" ctrlp bindings
nmap <leader>pp :CtrlP<CR>
nmap <leader>pb :CtrlPBuffer<CR>
nmap <leader>pm :CtrlPMixed<CR>
nmap <leader>ps :CtrlPMRU<CR>

" Opens tagbar to the right and moves into it
"nmap <C-T> :TagbarToggle<CR><C-W><C-L>

" Nvim specific
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
"set guicursor=
