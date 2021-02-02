" set \sc as syntastics hotkey
nmap <Leader>sc :SyntasticCheck<CR>
" passive syntax check
let g:syntastic_mode_map = { 'mode': 'passive' }

" recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" golang checker
" govet checker will failed while jumping the location from the error list
" window
if executable('go')
	let g:syntastic_go_checkers = [ 'go' ]
endif

" shell checker < brew install shellcheck >
if executable('shellcheck')
	let g:syntastic_sh_checkers = [ 'shellcheck' ]
	let g:syntastic_sh_shellcheck_args = "-x"
endif
