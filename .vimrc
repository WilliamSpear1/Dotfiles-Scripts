set nu
set relativenumber
filetype plugin on "netrw file browser
filetype plugin indent on

syntax on
set nu

set number relativenumber
set cursorline
set cursorcolumn

set noerrorbells
set tabstop=4 softtabstop=4 "replace tabes with spaces and amount of spaces in a tab character
set shiftwidth=4 "amount of spaces inserted when tabbing
set expandtab "replace tabs with spaces
set autoindent "maintain indentation from previous line
set nowrap
set smartcase
set noswapfile "stops from creating swapfile
set nobackup "stops from creating backup files
set undodir=~/.vim/undodir
set undofile
set incsearch
set linebreak

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
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
Plug 'sainnhe/everforest'
Plug 'plasticboy/vim-markdown'
call plug#end()

colorscheme everforest
set background=dark

"mapping
let mapleader="," "leader is comma


"map jk to ESC to save time
inoremap jk <esc>

"map ,f to open netrw in a vertical split
nnoremap <leader>f :Vexplore<CR>
"map ,F to open netrw
nnoremap <leader>F :Explore<CR>
"tab mappings
nnoremap <leader>t :tab split <CR>:Explore<CR>
nnoremap <leader>T :tab split <CR>
nnoremap <leader>w :tabclose<CR>
 nnoremap J :tabp<CR>
nnoremap K :tabn<CR>

nnoremap <leader><space> :nohlsearch<CR>

"clear search highlight after search
nnoremap <leader><space> :nohlsearch<CR>

"map j and k to move visually on wrapped lines
nnoremap j gj
nnoremap k gk
 
"map <C-k> and <C-j> to cycle windows
nnoremap <C-k> <C-w><C-W>
nnoremap <C-j> <C-w><S-w>

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
"nerd tree plugin
map <C-o> :NERDTreeToggle<CR>
set statusline+=#waringmsg#
set statusline+={SyntasticStatuslineFlag()}
set statusline+=%*

let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0

au Filetype c,c#,cpp,objc,objcpp call rainbow#load()
autocmd InsertEnter * norm zz
nnoremap<leader>q :wq<CR>
nnoremap<leader>w :w<CR>

