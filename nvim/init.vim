" basics
syntax enable
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set incsearch
set nohlsearch

" For NeoSolarized
set termguicolors



" plugins
call plug#begin('~/.local/share/nvim/plugged')

" NerdTree - Vim File manager
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" NerdTree - git annotations
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Deoplete - Code Completion with keys on j and k
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Vim Surround - Quoting/Parenthesizing
Plug 'tpope/vim-surround'

" Airline - Colorful Info Tabline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autosave
Plug '907th/vim-auto-save'

" Themes
Plug 'iCyMind/NeoSolarized'
Plug 'arcticicestudio/nord-vim'

" Git dif
Plug 'airblade/vim-gitgutter'

" Check syntax
Plug 'w0rp/ale'

" Latex 
Plug 'lervag/vimtex'

call plug#end()


" plugin configuration
"
"
"NERDTree
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeUpdateOnCursorHold = 0
let g:NERDTreeUpdateOnWrite      = 0
let NERDTreeHijackNetrw = 0


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
