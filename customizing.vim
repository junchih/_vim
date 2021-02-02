filetype plugin indent on
syntax on

" about tab key
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab

" coding mark columns
set colorcolumn=80,120

" scheme
colorscheme codedark
let g:airline_theme = 'codedark'
"set background=dark
hi Normal ctermbg=NONE
hi EndOfBuffer ctermbg=NONE
set t_Co=256

" blabla
set laststatus=2
set noswapfile
"set ruler
set hls
set scrolloff=2

set backspace=indent,eol,start

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" remap the leader key for hhkb
let mapleader = ","
" tmux like split
nmap <Leader>" :split<CR>
nmap <Leader>% :vsplit<CR>

"set foldlevel=99
