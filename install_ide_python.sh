#!/bin/sh

set -e

APT_SOFT="pylint"
PIP_SOFT="jedi pynvim"

sudo cp ./python.vim $STATIC_FILES_DIR/python.vim

sudo apt -y install $APT_SOFT
sudo pip3 install $PIP_SOFT

echo $PROGRESS "Setting up Neovim as python IDE"

echo "
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'

Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
" >> vim_plugs

echo "
\"Python configuration
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:jedi#completions_enabled = 0

au BufEnter,BufRead,BufNewFile *.py set filetype=python

let g:jedi#goto_assignments_command = \"\"
let g:jedi#goto_stubs_command = \"\"
let g:jedi#usages_command = \"\"
let g:jedi#completions_command = \"\"
let g:jedi#rename_command = \"\"
let g:syntastic_python_checkers = [\"pylint\"]
let g:syntastic_python_pylint_args = '-j4 -E --enable=R1714,W0621,W0612'
let g:jedi#show_call_signatures=0

autocmd filetype python let g:jedi#documentation_command=\"<leader>&\"
autocmd filetype python let g:jedi#goto_command=\"<leader>f\"
autocmd filetype python let g:jedi#auto_initialization=1
" >> ./config.vim
