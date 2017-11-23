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
"filetype indent on
filetype plugin indent on
" Autocomplete for command menu
set wildmenu
set showcmd
"redraw when needed
"set lazyredraw

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
let g:loaded_python3_provider=1

" Plugins initialisation
call plug#begin()

" -- Languages
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'

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
Plug 'majutsushi/tagbar'
"Plug 'felixhummel/setcolors.vim'

" -- Dropped
" Too much configs for it to work well on terminal
"Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

" Syntastic configuration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 3

"let g:syntastic_rust_rustc_exe = 'cargo check --all-features'
"let g:syntastic_rust_rustc_fname = ''
"let g:syntastic_rust_rustc_args = '--'
"let g:syntastic_rust_checkers = ['rustc']

" Airline configuration
let g:airline_powerline_fonts = 1

" YouCompleteMe config
"let g:ycm_rust_src_path="/home/luxed/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
" make YCM compatible with UltiSnips (using supertab) 
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Supertab Config
let g:SuperTabDefaultCompletionType = '<C-j>'

" UltiSnips config
let g:UltiSnipsExpandTrigger="<tab>" 
let g:UltiSnipsJumpForwardTrigger="<tab>" 
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" NerdTree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Ale Configs
"let g:ale_rust_cargo_use_check=0
"let g:ale_rust_cargo_check_all_targets=0
let g:airline#extensions#ale#enabled=1
let g:ale_linters = {'rust': ['rls']}

" Last because of plugin
" Force colors to 256
set t_Co=256
colorscheme kolor_custom

" indentLine config
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 234
"let g:indentLine_bgcolor_term = 235
"let g:indentLine_concealcursor=0
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_faster = 1

" Indent Guides config
"let g:indent_guides_auto_colors=0
"let g:indent_guides_guide_size=1
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
" colors work well with molokai
"hi IndentGuidesOdd ctermbg=235
"hi IndentGuidesEven ctermbg=237
