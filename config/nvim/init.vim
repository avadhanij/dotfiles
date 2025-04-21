" General
let mapleader = " "
set clipboard+=unnamedplus
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

lua << EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Lazy plugin manager
require('config.lazy')

-- Status line
require('config.lualine')

-- Tab line
require('config.tabline')

-- Telescope
require('config.telescope')

-- Tree
require('config.tree')

-- Treesitter
require('config.treesitter')

-- LSP
require('config.lsp')

-- Spectre
require('config.spectre')

EOF



