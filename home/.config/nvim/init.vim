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
set cmdheight=2

" Enable syntax based folding
set foldmethod=syntax

" Enable code completion
"set omnifunc=syntaxcomplete#Complete

" Key bindings
let mapleader = ","

" exit terminal
tnoremap <leader>n <C-\><C-N>
" remove highlight
nmap <leader>n :nohl<CR>

" buffers keybinds
set hidden
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <Space> za
nmap <leader><Space> zc

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

command! Cbr :tabedit term://cargo run --release

" Rust key maps
autocmd FileType rust map <F4> :Cb<CR>
autocmd FileType rust map <F5> :Cr<CR>
autocmd FileType rust map <F6> :Ct<CR>

" Python commands
command! Pr !clear && python %

" Python key maps
autocmd FileType python map <F5> :Pr<CR>

command! Kr !kotlinc -include-runtime -d run.jar hello.kt && java -jar run.jar

" Neovim configs
"let g:loaded_python3_provider=1

" Plugins initialisation
call plug#begin()

" -- Languages
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-markdownfootnotes'
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'udalov/kotlin-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'hspec/Hspec.vim'
Plug 'junegunn/vader.vim'
Plug 'vim-python/python-syntax'

" -- Syntax/Error checker
" NOTE: Consider testing 'autozimu/LanguageClient-neovim' as an LSP
" alternative
Plug 'w0rp/ale'

" Auto Completion and Snippets
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'zchee/deoplete-jedi'

" Interface and Themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'

" -- Utility
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
"Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'Luxed/vim-markdown-preview', { 'branch': 'firefox-quantum' }
" Python code folding
Plug 'tmhedberg/simpylfold'
Plug 'AndrewRadev/bufferize.vim'

call plug#end()

" Airline configuration
let g:airline_powerline_fonts = 0
" show buffers at the top of the screen
let g:airline#extensions#tabline#enabled = 1
" only show the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" UltiSnips config
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" NerdTree config
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" Ale Configs
let g:airline#extensions#ale#enabled=1
let g:ale_linters = {
    \ 'rust'    : ['rls'],
    \ 'glsl'    : ['glslang'],
    \ 'haskell' : ['hie']
\}
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_completion_enabled = 0
let g:ale_open_list = 0
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"let g:ale_lint_delay=50
nmap <leader>an :ALENextWrap<CR>
nmap <leader>ap :ALEPreviousWrap<CR>

" CtrlP config
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'
" ctrlp bindings
nmap <leader>pp :CtrlP<CR>
nmap <leader>pb :CtrlPBuffer<CR>
nmap <leader>pm :CtrlPMixed<CR>
nmap <leader>ps :CtrlPMRU<CR>

" Opens tagbar to the right and moves into it
nmap <C-T> :TagbarToggle<CR><C-W><C-L>

" Deoplete configuration
" Remove preview window
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
" Deoplete-rust configuration
let g:deoplete#sources#rust#racer_binary = '/home/luxed/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/home/luxed/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'
let g:deoplete#sources#rust#documentation_max_height = 0
let g:deoplete#sources#jedi#show_docstring = 1

" Pandoc vim config
let g:pandoc#modules#disabled = ['spell']

" Vim markdown preview config
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Firefox Quantum'
let vim_markdown_preview_pandoc=1
let vim_markdown_preview_use_xdg_open=1
"let vim_markdown_preview_toggle=3

let g:python_highlight_all = 1

" Force colors to 256
set t_Co=256
" Use my custom kolor colorscheme
colorscheme kolor_custom

" Remove issues on ShellInABox and Butterfly terminal
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
set guicursor=
