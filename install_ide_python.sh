#!/bin/sh

set -e

APT_SOFT="pylint"
PIP_SOFT="jedi pynvim"

sudo apt -y install $APT_SOFT
sudo pip3 install $PIP_SOFT

echo $PROGRESS "Setting up Neovim as python IDE"  # TODO Implement automation of this installation

#autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
#let g:jedi#completions_enabled = 0
#"let g:jedi#use_splits_not_buffers = "right"

#"TODO Only init jedi if filetype is Python
#let g:jedi#auto_initialization=1
#autocmd filetype python let g:jedi#auto_initialization=1
#let g:jedi#documentation_command="<leader>&"

#let g:jedi#goto_command = "<leader>f"
#let g:jedi#goto_assignments_command = ""
##let g:jedi#goto_stubs_command = ""
#let g:jedi#usages_command = ""
#let g:jedi#completions_command = ""
#let g:jedi#rename_command = ""
