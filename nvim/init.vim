"vim --startuptime vim.log basics
syntax enable
set showmatch              " Show matching brackets.
set number relativenumber  " Show the relative line numbers on the left side.
set incsearch
set nohlsearch
set expandtab              " insert spaces rather than tab for <Tab>
set smarttab               " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4              " the visible width of tabs
set softtabstop=4          " edit as if the tabs are 4 characters wide
set shiftwidth=4           " number of spaces to use for indent and unindent
set backupdir=/tmp
set directory=/tmp
set noswapfile             " disable swap files
set autoread               " detect when a file is changed
set ignorecase             " case insensitive searching
set incsearch              " set incremental search, like modern browsers
"set !cursorline            " highlight cursor line - TURNED OFF for performance reasons
set wrap                   " turn on line wrapping
set showbreak=…            " show ellipsis at breaking
set autoindent             " automatically set indent of new line
set smartindent            " use smarter indentation based on file type
set clipboard=unnamed      " use system clipboard

" Learn it the hard way
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" For theme
set termguicolors


" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" plugins
call plug#begin('~/.config/nvim/plugged')

" NerdTree - Vim File manager
"Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" NerdTree - git annotations
"Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Deoplete - Code Completion with keys on j and k
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Airline - Colorful Info Tabline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ThePrimeagen/vim-be-good'


" Autosave
Plug '907th/vim-auto-save'

" Themes
"Plug 'iCyMind/NeoSolarized'
Plug 'arcticicestudio/nord-vim'

" Git dif
Plug 'airblade/vim-gitgutter'

" git plugin
Plug 'tpope/vim-fugitive'                   

" Check syntax
Plug 'w0rp/ale'

" grammar checks
Plug 'rhysd/vim-grammarous'           

call plug#end()



" plugin configuration
"
" Faster startup
let g:python3_host_prog = '/usr/bin/python3'
"
"NERDTree
" How can I close vim if the only window left open is a NERDTree?
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
"map <C-n> :NERDTreeToggle<CR>
"let g:NERDTreeUpdateOnCursorHold = 0
"let g:NERDTreeUpdateOnWrite      = 0
"let NERDTreeHijackNetrw = 0


" Airline - Choose solarized dark theme
let g:airline_theme='base16_nord'
" let g:airline_solarized_bg='dark'



" deoplete
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" solarized
silent! colorscheme nord


" Autosave
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]
