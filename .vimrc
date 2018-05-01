"============================================================
" Plugin Manager = vim-plug
"============================================================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"== Specify Plugin Directory ==
call plug#begin('~/.vim/my-plugins')


"== Plugins ==

Plug 'vim-scripts/a.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeffreyiacono/vim-colors-wombat'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'valloric/youcompleteme'
Plug 'gilligan/vim-lldb'

call plug#end()


"============================================================
" PeteyCodes settings
"============================================================
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set guioptions=         " hide all scrollbars - they're ugly and useless

syntax on
colorscheme wombat

set smartindent
set clipboard=unnamed   " use os clipboard
set shiftwidth=4        " number of spaces when shift indenting
set tabstop=4           " number of visual spaces per tab
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tab to spaces
set number              " show line numbers
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set noswapfile

" airline
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1 
let g:airline_powerline_fonts = 1
set laststatus=2 " for airline

" ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r' " I copy and paste from other software a lot
let g:ctrlp_show_hidden=1

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0        " Don't ask about conf everytime we open a file


"============================================================
" Mappings
"============================================================

" More natural split opening defaults
set splitbelow
set splitright

" switch to left / right split 
map <C-h> <C-W>h
map <C-l> <C-W>l

" move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

" move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


"== Plugin Mappings ==

" Nerd Tree toggling
map <C-o> :NERDTreeToggle<CR>

" Move between lint errors
nnoremap <C-]> :ALENextWrap<CR>
nnoremap <C-[> :ALEPreviousWrap<CR>

" GoTo commands
nnoremap <C-g> :YcmCompleter GoTo<CR>

set noruler
set noshowmode

