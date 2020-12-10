#!/bin/sh

set -e

APT_SOFT="exuberant-ctags"
PIP_SOFT=""

#sudo apt -y install $APT_SOFT
#sudo pip3 install $PIP_SOFT

sudo cp ./rust.vim $STATIC_FILES_DIR/rust.vim

echo $PROGRESS "Setting up Neovim as rust IDE"

rustup toolchain install stable
rustup toolchain install nightly
rustup default stable
rustup component add rls rust-analysis rust-src
cargo +nightly install racer
if [ ! -f $(which rustfmt) ] ; then
    cargo install rustfmt-nightly
fi

RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/"

echo "
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'

Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
" >> vim_plugs

echo "
\" Rust configuration

autocmd BufRead,BufNewFile,BufEnter *.rs set filetype=rust

autocmd filetype rust nmap <buffer> <leader>f <plug>DeopleteRustGoToDefinitionDefault
autocmd filetype rust nmap <buffer> <leader>& <plug>DeopleteRustShowDocumentation
let g:deoplete#sources#rust#racer_binary='$(which racer)'
let g:deoplete#sources#rust#rust_source_path='$RUST_SRC_PATH'
" >> ./config.vim
