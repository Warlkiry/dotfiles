"Python configuration
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:jedi#completions_enabled = 0

au BufEnter,BufRead,BufNewFile *.py set filetype=python
au BufEnter,BufRead,BufNewFile *.rs set filetype=rust
au BufEnter,BufRead,BufNewFile *.cpp set filetype=cpp
au BufEnter,BufRead,BufNewFile *.c set filetype=c
au BufEnter,BufRead,BufNewFile *.hpp set filetype=cpp_header
au BufEnter,BufRead,BufNewFile *.h set filetype=c_header


let g:jedi#goto_assignments_command = ""
let g:jedi#goto_stubs_command = ""
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""
let g:syntastic_python_checkers = ["pylint"]
let g:syntastic_python_pylint_args = '-j4 -E --enable=R1714,W0621,W0612'
let g:jedi#show_call_signatures=0
let g:jedi#documentation_command=""
let g:jedi#goto_command=""

autocmd filetype python let g:jedi#auto_initialization=1
autocmd filetype python let g:jedi#documentation_command="<leader>&"
autocmd filetype python let g:jedi#goto_command="<leader>f"
