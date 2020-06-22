" This must be first, because it changes other options as side effect
set nocompatible

set termguicolors
set clipboard=unnamed

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
filetype off
call pathogen#helptags()
call pathogen#infect()

set rtp+=/opt/local/share/fzf/vim

" Change the leader
let mapleader=","
let g:mapleader=","

" Quickly reload/edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Mouse
if has('mouse')
  set mouse=a
endif
"set ttymouse=xterm2

" Easier moving between tabs
map <leader>t :tabnew<CR>
map <leader>[ :tabprevious<CR>
map <leader>] :tabnext<CR>

" CtrlP
" Use <leader>? to open ctrlp
let g:ctrlp_map = '<leader>?'
" Ignore these directories
set wildignore+=*/target/**
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit = 1

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Thanks to this we can have unwritten changes to a file and open a new file
" using :e, without being forced to write or undo our changes first.
set hidden

set nowrap
set backspace=indent,eol,start
set autoindent
set complete-=i
set copyindent
set number
set showmatch
set title
set noswapfile
set nobackup
set nowritebackup
set splitright
set splitbelow
set encoding=utf-8

" Filetype
filetype plugin indent on

set noshowmode                  " No need to show mode as we can see it in Airline
set history=100
set ruler
syntax on
set hlsearch
set incsearch
filetype plugin on

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

set complete=.,w,b,u,t
set completeopt=longest,menuone

" HTML
autocmd FileType html set shiftwidth=2
autocmd FileType html set tabstop=2
" Python
autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
" CSS
autocmd FileType css set shiftwidth=2
autocmd FileType css set tabstop=2
" JavaScript
autocmd FileType javascript set shiftwidth=4
autocmd FileType javascript set tabstop=4
" Scala
autocmd FileType scala set shiftwidth=2
autocmd FileType scala set tabstop=2

let iterm_profile = $ITERM_PROFILE
if iterm_profile == "Atom One Light" || has("gui_running")
    set background=light
    colorscheme one
    let g:airline_theme="one"
else
    set background=dark
    let ayucolor="mirage"
    colorscheme ayu
    let g:airline_theme="ayu_mirage"
endif

" Editing stuff
set colorcolumn=120

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>
noremap <leader>f :NERDTreeFind<CR>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Some useful remaps
nnoremap <silent> <leader>q :Sayonara<CR>

set pastetoggle=<F3>
map <silent> <leader>/ :nohlsearch<CR>

" This will enable us to do a sudo AFTER opening a file if we forgot to do that before.
cmap w!! w !sudo tee % >/dev/null

