#!/bin/sh

set -e

echo $PROGRESS "Setting up Neovim as C IDE"
sudo cp ./clang.vim $STATIC_FILES_DIR/clang.vim
echo "source $STATIC_FILES_DIR/clang.vim" >> ./config.vim

echo "
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'
" >> ./vim_plugs

echo "
\"C configuration
au BufEnter,BufRead,BufNewFile *.cpp set filetype=cpp
au BufEnter,BufRead,BufNewFile *.c set filetype=c
au BufEnter,BufRead,BufNewFile *.hpp set filetype=cpp_header
au BufEnter,BufRead,BufNewFile *.h set filetype=c_header
" >> ./config.vim
