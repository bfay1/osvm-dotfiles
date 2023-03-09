set number
set autoindent
set tabstop=4
set hlsearch
set incsearch
set title
set wrap
set shiftround
set shiftwidth=4
set smartcase
set cursorline
set noerrorbells
set wildmenu

let mapleader =","


if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/c.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/seoul256.vim'

call plug#end()

let g:ctrlp_custom_ignore = { 'dir': '\v[\/](\.(git|hg|svn)|\_site)$', 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$', }

let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>

let g:ycm_semantic_triggers = { 'c' : ['->', '.'], 'objc' : ['->', '.'], 'cpp.objcpp' : ['->', '.', '::'], 'perl' : ['->'], }

let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

set completeopt-=preview

nmap <leader>] :YcmCompleter GoTo<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR> 
nmap <leader>n :NERDTreeFind<CR>


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

set hidden
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

nnoremap <silent> <Right> :wincmd l <CR>
nnoremap <silent> <Left> :wincmd k <CR>
noremap <silent> <Up> :wincmd k <CR>
noremap <silent> <Down> :wincmd j <CR>

let g:seoul256_background = 233
colo seoul256

