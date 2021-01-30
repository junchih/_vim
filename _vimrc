let g:vim_home = get(g:, 'vim_home', expand('~/.vim/'))


" junegunn/vim-plug
call plug#begin(g:vim_home.'/.plugged')

Plug 'vim-syntastic/syntastic', { 'tag': '3.*' }
Plug 'vim-airline/vim-airline', { 'tag': 'v0.*' }
Plug 'dracula/vim',             { 'tag': 'v2.*', 'as': 'dracula' }
if executable('ctags')
	Plug 'preservim/tagbar', { 'tag': 'v3.*' }
endif
Plug 'tpope/vim-vinegar', { 'tag': 'v1.*' }

" tmux
Plug 'ericpruitt/tmux.vim', { 'rtp': 'vim/' }
" nix
Plug 'LnL7/vim-nix'
" lua
Plug 'tbastos/vim-lua'
" protobuf
Plug 'uarun/vim-protobuf'
" terraform
Plug 'hashivim/vim-terraform'
" c
Plug 'justinmk/vim-syntax-extra'
" php
Plug 'StanAngeloff/php.vim'

" golang
if executable('go')
	Plug 'fatih/vim-go', { 'tag': 'v1.*' }
endif

" ocaml, need merlin
if executable('ocamlmerlin')
	Plug 'ocaml/merlin', { 'tag': 'v3.*',  'rtp': 'vim/merlin/' }
endif

call plug#end()


" basic configuration
filetype plugin indent on
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=80,120
colorscheme dracula
"set background=dark
hi Normal ctermbg=NONE
set t_Co=256
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
nmap <Leader>% :vsplit<CR>
nmap <Leader>" :split<CR>

"set foldlevel=99

" plugins configurations
let config_files = [
		\ 'syntastic_setup.vim',
		\ 'tagbar_setup.vim',
		\ 'vimgo_setup.vim',
		\ 'ocaml_setup.vim',
	\ ]
for config_file in config_files
	exec 'source' g:vim_home.config_file
endfor
