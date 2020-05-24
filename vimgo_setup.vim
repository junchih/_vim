" disable auto gofmt while saving
let g:go_fmt_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_asmfmt_autosave = 0
let g:go_metalinter_autosave = 0
let g:go_imports_autosave = 0

" fix the conflict with syntastic
let g:go_fmt_fail_silently = 1
let g:go_list_type = "quickfix"

" auto helper
let g:go_updatetime = 3000
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1

" speed up vim while editting go files
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0

" colorful
let g:go_highlight_types = 1
let g:go_highlight_functions = 1

" see this issue https://git.io/fhdps, the gocode facing the serious problem.
" the original repository haven't been maintained any more, and the new main
" fork just merge some unstable feature, so I just close this feature for now.
let g:go_gocode_propose_source = 0
