let g:vim_home = get(g:, 'vim_home', expand('~/.vim/'))


" junegunn/vim-plug
call plug#begin(g:vim_home.'/.plugged')

	Plug 'tomasiser/vim-code-dark'

	Plug 'tpope/vim-vinegar',       { 'tag': 'v1.*' }
	Plug 'vim-syntastic/syntastic', { 'tag': '3.*' }
	Plug 'vim-airline/vim-airline', { 'tag': 'v0.*' }
	if executable('ctags')
		Plug 'preservim/tagbar',    { 'tag': 'v3.*' }
	endif

	" php
	Plug 'StanAngeloff/php.vim'

	" golang
	if executable('go')
		Plug 'fatih/vim-go', { 'tag': 'v1.*' }
	endif

	" fsharp, need fsharp & mono
	if executable('fsharpi')
		Plug 'kongo2002/fsharp-vim'
	endif

	" tmux
	Plug 'ericpruitt/tmux.vim', { 'rtp': 'vim/' }
	" nix
	Plug 'LnL7/vim-nix'
	" c
	Plug 'justinmk/vim-syntax-extra'
	" lua
	Plug 'tbastos/vim-lua'

	" protobuf
	Plug 'uarun/vim-protobuf'
	" terraform
	Plug 'hashivim/vim-terraform'

call plug#end()

" plugins configurations
let setup_files = split(globpath(g:vim_home, '*_setup.vim'), '\n')
for setup_file in setup_files
	exec 'source' setup_file
endfor

" customizing
exec 'source' g:vim_home.'customizing.vim'
