" set \sc as its hotkey
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
let g:syntastic_go_checkers = [ 'go' ]

" ocaml checker
let g:syntastic_ocaml_checkers = [ 'merlin' ]

" shell checker < brew install shellcheck >
let g:syntastic_sh_checkers = [ 'shellcheck' ]
let g:syntastic_sh_shellcheck_args = "-x"
