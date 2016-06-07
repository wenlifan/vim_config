set nocompatible
set number                  " current line number
set relativenumber          " relative line number
set backspace=indent,eol,start
set smarttab
set expandtab
set nobackup		        " do not keep a backup file, use versions instead
set ruler		            " show the cursor position all the time
set showcmd		            " display incomplete commands
set incsearch		        " do incremental searching
set hlsearch
set autoindent		        " always set autoindenting on
set smartindent
set noignorecase
set wildmenu
set autoread
set nobackup
set nowritebackup
set noswapfile
set cursorline
set cursorcolumn
set mouse=v
set history=100		        " keep 50 lines of command line history
set softtabstop=4
set tabstop=4
set shiftwidth=4
set foldmethod=syntax       "set default foldmethod
set fileencodings=utf-8,ucs-bom,cp936

if has("gui_running")
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
    set lines=999 columns=999
endif
syntax on

set path+=/usr/include
set path+=/usr/local/include
set path+=/usr/include/c++/4.9
set path+=/usr/include/x86_64-linux-gnu/c++/4.9

let mapleader=","

map Q gq
inoremap <C-U> <C-G>u<C-U>

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" vundle
set nocompatible              " be iMproved, required filetype off                  " required 
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter' " <leader>cc: comment, <leader>cu: uncomment
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tomasr/molokai'
"Plugin 'JuliaLang/julia-vim'
Plugin 'zah/nimrod.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_always_populate_location_list = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<c-n>']
let g:ycm_key_list_previous_completion = ['<c-p>']
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

nnoremap <leader>gf :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinition<CR>

let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

" vim-airline
set laststatus=2
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

" ctrlp
let g:ctrlp_map = '<c-\>'
let g:ctrlp_cmd = 'CtrlP .'
let g:ctrlp_show_hidden = 1

" nerdtree
noremap <leader>nd :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<CR>

let NERDTreeChDirMode=2 " set current dir as root
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
    \ && b:NERDTreeType == "primary") | q | endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" molockai
colo molokai
let g:molokai_original=1

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
let g:UltiSnipsEditSplit="vertical"

nmap  :cp<CR>
nmap  :cn<CR>

nmap  :bp<CR>
nmap  :bn<CR>
nmap  :bd<CR>

nmap <leader>sf :vim /<C-R><C-W>/ %<CR>
nmap <leader>sr :vim /<C-R><C-W>/ **/*.

" esay compile
nmap <leader>mr :w<CR>:!./%<CR>
nmap <leader>md :w<CR>:!rdmd -g %<CR>
nmap <leader>mn :w<CR>:!nim c -r --threads:on --verbosity:2 %<CR>
nmap <leader>mg :w<CR>:!g++ --version;g++ -fdiagnostics-color=auto -Wall -pthread -std=c++14
    \ % -oa.out;./a.out<CR>
nmap <leader>mc :w<CR>:!clang++ --version;clang++ -Wall -pthread -std=c++14 % -oa.out;./a.out<CR>
