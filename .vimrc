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
" thon:
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
call plug#end()
" }}}
" MAPPINGS -------------------------------------------------- {{{
"mapping
let mapleader="," "leader is comma

autocmd InsertEnter * norm zz

"map jk to esc to save time
 inoremap jk <esc>

"map ,f to open netrw in a vertical split
nnoremap <leader>f :vexplore<cr>
"map ,f to open netrw
nnoremap <leader>f :explore<cr>

"tab mappings
 nnoremap <leader>t :tab split <cr>:explore<cr>
 nnoremap <leader>t :tab split <cr>
 nnoremap <leader>w :tabclose<cr>
" nnoremap j :tabp<cr>
" nnoremap k :tabn<cr>

"clear search highlight after search
nnoremap <leader><space> :nohlsearch<cr>

"map j and k to move visually on wrapped lines
nnoremap j gj
nnoremap k gk
 
"map <c-k> and <c-j> to cycle windows
nnoremap <c-k> <c-w><c-w>
nnoremap <c-j> <c-w><s-w>

nnoremap<leader>q :wq<cr>
nnoremap<leader>w :w<cr>

nnoremap n nzz
nnoremap n nzz

let NERDTreeIgnore=['\.git$','\.jpg$','\.mp4$','\.ogg$','\.iso$','\.pdf$', '\.pyc$', '\.odt$', '\.png$','\.gif$','\.db$']

"nerd tree plugin
map <C-o> :NERDTreeToggle<CR>
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

" If Vim version is equal to or greate than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
"if version >= 703
"    set undodir=~/.vim/backup
"    set undofile
"    set underreload=10000
"endif

" }}}
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

 " set statusline+={SyntasticStatuslineFlag()}
" set statusline+=%*
"}}}--------------------------------------------------------------------------
colorscheme nord 
