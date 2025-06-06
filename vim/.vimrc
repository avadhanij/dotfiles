" General options
let mapleader = " "
set background=dark 
set noshowmode
set number

let ostype=system('uname -s')
if ostype =~ "Linux"
    vnoremap <C-c> :w !xsel -i -b<CR><CR>
elseif ostype =~ "Darwin"
    vnoremap <C-c> :w !pbcopy<CR><CR>
endif

filetype plugin indent on
syntax enable
set encoding=utf-8
set history=1000
set tabpagemax=50
set wildmenu
set scrolloff=1
set sidescrolloff=5
set display+=lastline

" Indentation options
set autoindent
set cindent
set expandtab
set textwidth=120
set colorcolumn=121
set backspace=indent,eol,start
set complete-=i

" Buffer options
nnoremap <silent> = :bn<cr>
nnoremap <silent> - :bp<cr>
nnoremap <leader>q :bd<cr>
set hidden

" Navigation options
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Search options
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase

" Function to open scratch window
function! Scratch()
    vsplit
    e ~/.scratch
endfunction

" Nvim Python discovery
if exists("$VIRTUAL_ENV")
	let python_path=$VIRTUAL_ENV..'/bin/python'
else
	let python_path='/usr/local/bin/python3'
endif
let g:loaded_python_provider=0
let g:python3_host_prog=python_path

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Takes care of batch commenting
Plug 'tpope/vim-commentary'

" Takes care of auto pairing surrounds
Plug 'jiangmiao/auto-pairs'

" Takes care of inserting string surrounds
Plug 'tpope/vim-surround'

" Takes care of proper pasting. No more :set paste
Plug 'ConradIrwin/vim-bracketed-paste'

" Takes care of showing indent lines
Plug 'Yggdroot/indentLine'

" File explorer
Plug 'preservim/nerdtree'

" File Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status bar
Plug 'vim-airline/vim-airline'

" Buffer Explorer
Plug 'jeetsukumaran/vim-buffergator'

" Vim Ripgrep
Plug 'jremmen/vim-ripgrep'

" Vim tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Vim buffer tabs
Plug 'ap/vim-buftabline'

" Editorconfig 
Plug 'editorconfig/editorconfig-vim'

" Initialize plugin system
call plug#end()

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" Color scheme
colorscheme gruvbox

" Statusline options
set noshowmode
let g:airline_powerline_fonts=1

" FZF options
set rtp+=/usr/local/opt/fzf

" nnoremap <leader>a :Ag<Space>
nnoremap <leader>f :Files<CR>

" NERDTree options
noremap <C-n> :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '__pycache__', '\.egg-info', '.code-workspace']
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
let g:plug_window = 'noautocmd vertical topleft new'

" Buffergator options
let g:buffergator_viewport_split_policy='B'

