" Rust configuration
autocmd filetype rust nmap <buffer> <leader>f <plug>DeopleteRustGoToDefinitionDefault
autocmd filetype rust nmap <buffer> <leader>& <plug>DeopleteRustShowDocumentation
autocmd filetype rust nmap <buffer> <leader>é :RustFmt<CR>
let g:deoplete#sources#rust#racer_binary='/home/john/.cargo/bin//racer'
let g:deoplete#sources#rust#rust_source_path='/home/john/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library'
