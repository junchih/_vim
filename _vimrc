let g:vim_home = get(g:, 'vim_home', expand('~/.vim/'))


" junegunn/vim-plug

call plug#begin(g:vim_home.'/.plugged')

Plug 'vim-syntastic/syntastic'

Plug 'vim-airline/vim-airline'

" < brew install ctags >
Plug 'majutsushi/tagbar'

" golang plugin < brew install golang >
Plug 'fatih/vim-go', {
		\ 'do': ':GoInstallBinaries',
	\ }

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
		\ 'vimgo_setup.vim',
	\ ]

for config_file in config_files
	exec 'source' g:vim_home.config_file
endfor
