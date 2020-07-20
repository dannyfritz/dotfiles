scriptencoding utf-8

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Plug 'embear/vim-localvimrc'
Plug 'tpope/vim-sensible'
"Plug 'jreybert/vimagit'
Plug 'tomtom/tcomment_vim'
Plug 'joshdick/onedark.vim'
Plug 'sickill/vim-monokai'
" Plug 'vim-airline/vim-airline'
" Plug 'bling/vim-bufferline'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'benmills/vimux'
" Plug 'jeetsukumaran/vim-buffergator'
Plug 'sheerun/vim-polyglot'
Plug 'jtratner/vim-flavored-markdown'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'simias/YankRing.vim'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/targets.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'christoomey/vim-sort-motion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dominikduda/vim_current_word'
" Plug 'bronson/vim-visual-star-search'
" Plug '907th/vim-auto-save'
" Plug 'scrooloose/syntastic'
" Plug 'w0rp/ale'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

call plug#end()

set nocompatible
set cursorline
set visualbell
set mouse=a
set nowrap
set hidden

filetype plugin on

syntax on
colorscheme onedark

if !has('gui_running')
  set t_Co=256
endif

set hlsearch
set ignorecase
set smartcase
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

set number relativenumber

set noshowmode
set showcmd

let g:lightline = {}
let g:lightline.colorscheme = 'wombat'
let g:lightline.active = {'left': [ [ 'mode', 'paste' ], ['buffers'] ]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

let g:lightline#bufferline#reverse_buffers = 0
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#filename_modifier = ':.'

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

let mapleader = ' '
" imap jj <Esc>

nmap <S-j> <PageDown>
nmap <S-k> <PageUp>

nmap <Leader>w :bn<CR>
nmap <Leader>q :bd<CR>
nmap <Leader>W :Leaderf buffer --popup --reverse<CR>

map <Leader>p :YRShow<CR>

let g:indentLine_enabled = 1
let g:indentLine_char = '▏'

let g:strip_whitespace_on_save=0

set listchars=tab:>\ ,eol:¶,nbsp:·,space:·

hi CurrentWord gui=bold guifg=0 cterm=bold ctermfg=15
hi CurrentWordTwins gui=bold guifg=0 cterm=bold ctermfg=15

let g:asyncrun_open=10
nmap <Leader>r :AsyncTask project-run<CR>
nmap <Leader>R :VimuxCloseRunner<CR>
nmap <Leader>t :AsyncTask project-build<CR>
nmap <Leader>T :AsyncTask project-test<CR>

function! s:run_tmux(opts)
    " asyncrun has temporarily changed dir for you
    " getcwd() in the runner function is the target directory defined in `-cwd=xxx`
    let cwd = getcwd()
    call VimuxRunCommand('cd ' . shellescape(cwd) . '; ' . a:opts.cmd)
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.tmux = function('s:run_tmux')

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <Leader>o :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore=['\.vim$', '\.swp$[[file]]', '\~$']

let g:Lf_PopupWidth = &columns * 9 / 10
nmap <Leader>d :Leaderf file --popup --reverse<CR>
nmap <Leader>: :Leaderf command --popup --reverse<CR>
nmap <Leader>f :Leaderf line --popup --cword --reverse<CR>
nmap <Leader>F :Leaderf rg -C 2 --fullScreen --cword --reverse<CR>

let g:LIST = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_auto_close = 1

let g:auto_save = 1
let g:auto_save_silent = 1

