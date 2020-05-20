let g:vim_home = get(g:, 'vim_home', expand('~/.vim/'))


" junegunn/vim-plug
call plug#begin(g:vim_home.'/.plugged')

Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'dracula/vim', {'as': 'dracula'}
" tmux
Plug 'ericpruitt/tmux.vim', {'rtp': 'vim/'}

" nix
Plug 'LnL7/vim-nix'
" lua
Plug 'tbastos/vim-lua'
" haskell
Plug 'neovimhaskell/haskell-vim'
" protobuf
Plug 'uarun/vim-protobuf'
" terraform
Plug 'hashivim/vim-terraform'

" c
Plug 'justinmk/vim-syntax-extra'
" python
Plug 'vim-python/python-syntax'

" ctags
if executable('ctags')
	Plug 'majutsushi/tagbar'
endif
" golang
if executable('go')
	Plug 'fatih/vim-go'
endif

" ocaml, need opam & merlin
if executable('opam')
	let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
	if isdirectory(g:opamshare . "/merlin/vim")
		execute "Plug '" . g:opamshare . "/merlin/vim'"
	endif
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
"set background=dark
colorscheme dracula
set t_Co=256
set laststatus=2
set noswapfile
"set ruler
set hls
set scrolloff=2

set backspace=indent,eol,start

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

nmap <Leader>ex :Explore<CR>
nmap <Leader>% :vsplit<CR>
nmap <Leader>" :split<CR>

"set foldlevel=99

" plugins configurations
let config_files = [
		\ 'syntastic_setup.vim',
		\ 'tagbar_setup.vim',
		\ 'haskell_setup.vim',
		\ 'vimgo_setup.vim',
		\ 'ocaml_setup.vim',
	\ ]
for config_file in config_files
	exec 'source' g:vim_home.config_file
endfor
