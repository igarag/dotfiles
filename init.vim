"*** CONFIG **********************************
set encoding=utf-8
set number relativenumber
syntax enable
set noswapfile
" keep 7 lines from top and bottom when scroll
set scrolloff=7 
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set fileformat=unix

let mapleader=','

" *** PLUGINS ***********************************************
call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sirver/ultisnips'


call plug#end()

colorscheme gruvbox

let g:deoplete#enable_at_startup = 1
let g:airline_theme='gruvbox'

if (has("termguicolors"))
	set termguicolors
endif

lua require 'colorizer'.setup()

" NERDCommenter
nmap <C-S-F2> <Plug>NERDCommenterToggle
vmap <C-S-F2> <Plug>NERDCommenterToggle<CR>gv

" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <F2> :NERDTreeToggle<CR>

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-w> :bd<CR>

" Ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<tab>"
