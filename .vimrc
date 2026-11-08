" GENERAL SETTINGS -------------------------------------------------------{{{
set nu relativenumber
set cursorline cursorcolumn
filetype plugin on "netrw file browser
filetype plugin indent on

syntax on

set noerrorbells


"set tabstop=4 softtabstop=4 "replace tabes with spaces and amount of spaces in a tab character
"set shiftwidth=4 "amount of spaces inserted when tabbing
"set expandtab "replace tabs with spaces
"set autoindent "maintain indentation from previous line
" then:
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set autoindent
set smartcase
set noswapfile "stops from creating swapfile
set nobackup "stops from creating backup files
set undodir=~/.vim/undodir
set undofile
set incsearch
set linebreak
set showmode
set showcmd
set showmatch
set hlsearch
set colorcolumn=80
set wildmenu
set wildmode=list:longest
set wildignore=*.jpg,*.png,*.pdf,*.gif,*.img
highlight ColorColumn ctermbg=0 guibg=lightgrey
inoremap jk <esc>
let g:mapleader=" "
nnoremap <leader>J :tabprevious<CR>
nnoremap <leader>K :tabnext<CR>
nnoremap <leader>C :tabclose<CR>
nnoremap <leader>V :action SplitVertically<CR>
nnoremap <leader>H :action SplitHorizontally<CR>
nnoremap <leader>U :action Unsplit<CR>
nnoremap <leader>M :action MoveEditorToOppositeTabGroup<CR>
nnoremap <leader>EN :action EditSourceInNewWindow<CR>
nnoremap <leader>N :action NextWindow<CR>
nnoremap <leader>Q :action CloseContent<CR>
nnoremap <leader>QA :action CloseAllEditors<CR>
nnoremap <leader>gc :action GottoClass<CR>
nnoremap <leader>gd :action GotToDeclaration<CR>
nnoremap <leader>gt :action GottoTest<CR>
nnoremap <leader>gf :action FindUsages<CR>
" set ideajoin
"}}} ----------------------------------------------------------------------

" PLUGINS ---------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'                                                                                                      
Plug 'junegunn/vim-github-dashboard'
Plug 'tpope/vim-fugitive'
Plug 'kien/rainbow_parentheses.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'morhetz/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/everforest'
Plug 'plasticboy/vim-markdown'
Plug 'arcticicestudio/nord-vim'
Plug 'sudar/vim-arduino-syntax'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
call plug#end()
" }}}

" BRACES COLORING -----------------------------------------------------------------{{{
let g:syntastic_alaways_popluate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastsic_check_on_wq=0

let g:rbp_colorpairs=[
\ ['brown', 'RoyalBlue3'],
\ ['Darkblue', 'SeaGreen3'],
\ ['darkgray', 'DarkOrchid3'],
\ ['darkgreen', 'firebrick3'],
\ ['darkcyan', 'RoyalBlue3'],
\ ['darkred', 'SeaGreen'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['brown', 'firebrick3'],
\ ['gray', 'RoyalBlue3'],
\ ['black', 'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['Darkblue', 'RoyalBlue3'],
\ ['darkgreen', 'RoyalBlue3'],
\ ['darkcyan', 'SeaGreen3'],
\ ['darkred', 'DarkOrchid3'],
\ ['red', 'firebrick3'],
\ ]

let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
au Filetype c,c#,cpp,objc,objcpp call rainbow#load()
"}}} ---------------------------------------------------------------------

" VIMSCRIPT -------------------------------------------------------------- {{{ 
" This will enable code folding. 
" Use the marker method of folding. 
augroup filetype_vim     
    autocmd!     
    autocmd FileType vim setlocal foldmethod=marker 
augroup END 
"}}} ---------------------------------------------------------------------

" STATUS LINE ------------------------------------------------------------ {{{
   " Clear status line when vimrc is reloaded.
"set statusline=

" Status line left side.
"set statusline+=\ %F\ %M\ %Y\ %R

" Use a diverder to separate the left side from the right side
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the stauts on the second to last line.
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers" set statusline+=#waringmsg#
" ~/full/path-to/file-name.js 
let g:airline#extensions#tabline#formatter = 'default'  
" f/p/file-name.js 
let g:airline#extensions#tabline#formatter = 'jsformatter' 
" path-to/f 
let g:airline#extensions#tabline#formatter = 'unique_tail' 
" file-name.js 
 let g:airline#extensions#tabline#formatter = 'unique_tail_improved' 
" Start interactive EasyAlign in visual mode (e.g. vipga) 
xmap ga <Plug>(EasyAlign) 
 " Start interactive EasyAlign for a motion/text object (e.g. gaip) 
nmap ga <Plug>(EasyAlign)

 " set statusline+={SyntasticStatuslineFlag()}
" set statusline+=%*
"}}}--------------------------------------------------------------------------
"
colorscheme nord 
