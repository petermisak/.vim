" My own .vimrc file. To a large extend, inspired by Jessie Frazzelle's .vimrc
" (https://github.com/jessfraz/.vim.git)

" Use Pathogen for plugins
execute pathogen#infect()
call pathogen#helptags()

set nocompatible                " Set this at the very beginning
filetype off

" Filetype detection on
filetype plugin indent on


"""" Settings

" Thanks to this we can have unwritten changes to a file and open a new file
" using :e, without being forced to write or undo our changes first.
set hidden

set wrap
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set encoding=utf-8              " Set default encoding to utf-8
set lazyredraw                  " Redraw only when necessary
set backspace=indent,eol,start
set title
set noswapfile
set nobackup
set nowritebackup
set splitright                  " Split vertical right to the current window
set splitbelow                  " Split horizontal below to the current window

" Indentation
set autoindent                  " Auto-indent always
set smartindent                 " Tabs according to shiftwidth, not tabstop
set complete-=i
set showmatch                   " Show matching parenthesis
set copyindent                  " Copy the previous indentation on autoindenting

set ruler                       " Show cursor position in Airline
set noshowmode                  " No need to show mode as we can see it in Airline
set history=100
syntax on
set hlsearch
set incsearch
filetype plugin on

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab                   " Tabs are spaces

set complete=.,w,b,u,t
set completeopt=longest,menuone

set termguicolors
set clipboard=unnamed

" Editing stuff
set colorcolumn=120

set rtp+=/opt/local/share/fzf/vim

if &tabpagemax < 50
  set tabpagemax=50
endif

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

set wildmenu                    " Turn wildmenu on
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore+=.hg,.git,.svn
set wildignore+=*.swp,*.bak,*.pyc,*.class
set wildignore+=*.DS_Store
set wildignore+=*/target/**

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
" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2

" Theme
let iterm_profile = $ITERM_PROFILE
if iterm_profile == "Atom One Light" || has("gui_running")
  set background=light
  colorscheme one
  let g:airline_theme="one"
elseif iterm_profile == "Material / PaperColor"
  set background=light
  colorscheme PaperColor
  let g:airline_theme="papercolor"
else
  set background=dark
  let ayucolor="mirage"
  colorscheme ayu
  let g:airline_theme="ayu_mirage"
endif

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set pastetoggle=<F3>
map <silent> <leader>/ :nohlsearch<CR>

" This will enable us to do a sudo AFTER opening a file if we forgot to do that before.
cmap w!! w !sudo tee % >/dev/null

" For all text files set 'textwidth' to 80 characters.
autocmd FileType text setlocal textwidth=80 fo+=2t ts=2 sw=2 sts=2 expandtab
autocmd BufNewFile,BufRead *.md,*.txt,*.adoc setlocal textwidth=80 fo+=2t ts=2 sw=2 sts=2 expandtab


"""" Plugins

"""" CtrlP
" Use <leader>? to open ctrlp
let g:ctrlp_map = '<leader>?'
" Ignore these directories
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit = 1

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

" Sayonara
nnoremap <silent> <leader>q :Sayonara<CR>
nnoremap <silent> <leader>Q :Sayonara!<CR>

" vim:ts=2:sw=2:et
