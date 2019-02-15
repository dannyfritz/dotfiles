if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'sickill/vim-monokai'
"Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
"Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'vim-scripts/todo-vim'
Plug 'vim-scripts/TaskList.vim'
Plug 'w0rp/ale'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'vim-scripts/cream-showinvisibles'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --rust-completer --ts-completer' }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'jtratner/vim-flavored-markdown'
"Plug 'airblade/vim-gitgutter'

call plug#end()

set encoding=utf8
set nowrap
set nocompatible
set wildmenu
set cursorline
set showcmd
set hlsearch
set ignorecase
set smartcase
filetype indent plugin on
" set autoindent
set visualbell

set mouse=a

if !has('gui_running')
  set t_Co=256
endif

syntax on
colorscheme onedark
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set noshowmode
set laststatus=2

nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

set backspace=indent,eol,start


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-o> :NERDTreeToggle<CR>
map <C-p> :Leaderf file<CR>
" let NERDTreeShowHidden=1
let NERDTreeShowBookmarks = 1

let g:LIST = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_auto_close = 1

let g:ycm_min_num_of_chars_for_completion = 1

"nmap <C-m> :TODOToggle<CR>
"let g:searchtasks_list=["TODO"]
let g:tlWindowPosition = 1
