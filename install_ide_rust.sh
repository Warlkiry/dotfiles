#!/bin/sh

set -e

APT_SOFT="exuberant-ctags"
PIP_SOFT=""

#sudo apt -y install $APT_SOFT
#sudo pip3 install $PIP_SOFT

echo $PROGRESS "Setting up Neovim as rust IDE"  # TODO Implement automation of this installation

rustup toolchain install stable
rustup toolchain install nightly
rustup default stable
rustup component add rls rust-analysis rust-src
cargo +nightly install racer

RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/"
cargo install rustfmt-nightly

#TODO   Source rust vim config script if Rust IDE is set up
    #Plug 'rust-lang/rust.vim'
    #Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    #Plug 'sebastianmarkow/deoplete-rust'
    #Plug 'majutsushi/tagbar'
    #Plug 'vim-syntastic/syntastic'


    #let g:deoplete#enable_at_startup = 1
    #echo "let g:deoplete#sources#rust#racer_binary='$(whereis racer |cut -d ' ' -f 2)'" >> ./$CONFIG_VIM_TMP
    #echo "let g:deoplete#sources#rust#rust_source_path='$RUST_SRC_PATH'"
    #echo "autocmd filetype rust nmap <buffer> <leader>f <plug>DeopleteRustGoToDefinitionDefault" >> ./$CONFIG_VIM_TMP
    #echo "autocmd filetype rust nmap <buffer> <leader>& <plug>DeopleteRustShowDocumentation" >> ./$CONFIG_VIM_TMP


    #highlight SyntasticErrorLine guifg=#ff5353 gui=bold
    #highlight SyntasticErrorSign guifg=#ff5353 gui=bold
    #highlight SyntasticError guifg=#ff5353 guibg=NONE gui=bold

    #highlight SyntasticWarningLine guifg=#ffc453 gui=italic
    #highlight SyntasticWarningSign guifg=#ffc453 gui=italic
    #highlight SyntasticWarning guifg=#ffc453 guibg=NONE gui=bold
    
    #set statusline+=%#warningmsg#
    #set statusline+=%{SyntasticStatuslineFlag()}
    #set statusline+=%*

    #let g:syntastic_always_populate_loc_list = 1
    #let g:syntastic_auto_loc_list = 1
    #let g:syntastic_check_on_open = 0
    #let g:syntastic_check_on_wq = 0
    #nnoremap <leader>a :SyntasticCheck<CR> :wincmd w<CR>
    #nmap <F2> :TagbarToggle<CR>
    #let g:tagbar_autofocus = 1
    #let g:tagbar_autoclose = 1


#TODO add rust to active_filetypes if not set 
    #let g:syntastic_mode_map = {
        #\ "mode": "passive",
        #\ "active_filetypes": ["python", "ruby", "php", "rust", "c", "bash", "c++"],
        #\ "passive_filetypes": ["puppet"] }
