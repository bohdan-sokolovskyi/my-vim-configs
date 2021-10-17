filetype plugin indent on

set encoding=UTF-8 
set nocompatible "turn off compatible with vi

set background=dark
syntax enable "turn on syntax hilighting
syntax on

if empty(glob('~/.vim/autoload/plug.vim')) 
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.vim/bundle')
Plug 'tonsky/FiraCode'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim'
Plug 'cocopon/iceberg.vim'
Plug 'romainl/flattened'
Plug 'jpalardy/vim-slime'
Plug 'plasticboyim-markdown'
Plug 'vlime/vlimeo'
Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/paredit.vim'
call plug#end()

"Airline options
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='UTF-8'
let g:airline#extensions#xkblayout#enabled = 0

"Slime options
let g:slime_target = "vimterminal"
let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/slime/start-swank.lisp\""'

"Vlime option
let g:vlime_cl_impl = "sbcl"

"NERDTree options
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-p> :NERDTreeToggle<CR>

"Icons and font
set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16

"set color scheme
"set termguicolors
colorscheme dracula

set number relativenumber
set wrap linebreak nolist
set cursorline
set ttimeoutlen=10

let &t_SI.="\e[5 q"
let &t_SR.="\e[3 q"
let &t_EI.="\e[1 q"
