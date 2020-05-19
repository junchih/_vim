let g:vim_home = get(g:, 'vim_home', expand('~/.vim/'))


" junegunn/vim-plug
call plug#begin(g:vim_home.'/.plugged')

Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
" haskell
Plug 'neovimhaskell/haskell-vim'
" c
Plug 'justinmk/vim-syntax-extra'
" python
Plug 'vim-python/python-syntax'
" tmux
Plug 'ericpruitt/tmux.vim', {'rtp': 'vim/'}

" protobuf
Plug 'uarun/vim-protobuf'
" terraform
Plug 'hashivim/vim-terraform'

" ctags
Plug 'majutsushi/tagbar'
" golang
Plug 'fatih/vim-go'

" ocaml, need opam & merlin
if executable('opam')
	let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
	if isdirectory(g:opamshare . "/merlin/vim")
		Plug g:opamshare . "/merlin/vim"
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
set background=dark
set t_Co=256
set laststatus=2
set noswapfile
"set ruler
set hls

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
	\ ]
for config_file in config_files
	exec 'source' g:vim_home.config_file
endfor
