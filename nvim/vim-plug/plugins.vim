" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" *** PLUGINS ***********************************************
call plug#begin('~/.local/share/nvim/plugged')

" Autocompletition section. Choose between deoplete or CoC.
" - DEOPLETE -----------------------------------------
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'uplus/deoplete-solargraph'
" - CoC ----------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Python syntax
Plug 'davidhalter/jedi-vim'
" auto-complete parenthesis and other brackets
Plug 'jiangmiao/auto-pairs'
" Navegation tree (using F3 shortcut)
Plug 'scrooloose/nerdtree'
Plug 'norcalli/nvim-colorizer.lua'
" Bottom bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sirver/ultisnips'
" Comment like a classic IDE
Plug 'preservim/nerdcommenter'
" Find files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Set the project root
Plug 'airblade/vim-rooter'
" Seach between differente open files
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" Run index page
Plug 'mhinz/vim-startify'
" Themes
Plug 'christianchiarulli/nvcode-color-schemes.vim'
"Plug 'joshdick/onedark.vim'
"Plug 'morhetz/gruvbox'
"Plug 'sainnhe/sonokai'
" Themes for bottom bar
Plug 'itchyny/lightline.vim'
" scroll smoothie
Plug 'psliwka/vim-smoothie'

call plug#end()
