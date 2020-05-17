let g:vim_home = get(g:, 'vim_home', expand('~/.vim/'))


" junegunn/vim-plug
call plug#begin(g:vim_home.'/.plugged')

Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
" need ctags
Plug 'majutsushi/tagbar'

" haskell filetype plugin
Plug 'neovimhaskell/haskell-vim'

" golang plugin
Plug 'fatih/vim-go'

" for ocaml, need opam & merlin
if executable('opam')
	let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
	if isdirectory(g:opamshare . "/merlin/vim")
		Plug g:opamshare . "/merlin/vim"
	endif
endif

" clang plugin
Plug 'justmao945/vim-clang'

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
		\ 'clang_setup.vim',
	\ ]
for config_file in config_files
	exec 'source' g:vim_home.config_file
endfor
