call plug#begin()
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree'

    Plug 'thaerkh/vim-workspace'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " TODO Only add in Rust IDE config file
    Plug 'majutsushi/tagbar'
    Plug 'vim-syntastic/syntastic'
    Plug 'rust-lang/rust.vim'
    Plug 'sebastianmarkow/deoplete-rust'

    " TODO only add in Python IDE config file
    Plug 'davidhalter/jedi-vim'
    Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()



" GENERAL OPTIONS
set completeopt=noinsert,menuone,noselect
set undofile
set shortmess+=c
highlight SignColumn guibg=<X>
set noswapfile
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
"set completeopt-=preview

"Command executed when saving
au BufWritePost * if v:this_session != "" | exe "mksession! ".v:this_session

" INTERFACE

set number                  " add line numbers
let g:indentLine_setColors = 1
let g:indentLine_color_term = 1
let g:indentLine_char = '┊'
syntax on
if has("termguicolors") && has("nvim") " set true colors on NeoVim
    set termguicolors
endif

set background=dark
set cursorline

highlight LineNr guifg=#5b4366
highlight CursorLineNR gui=bold guifg=#b787cc
highlight CursorLine guibg=#303030
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6
highlight VertSplit gui=NONE guifg=#505050 guibg=NONE

highlight Search guibg=NONE guifg=#ffc453 gui=underline,bold
highlight QuickFixLine gui=NONE guibg=NONE guifg=#ffc453
highlight TODO guibg=NONE guifg=#dd5dc4 gui=underline,bold

let g:syntastic_enable_signs = 1

"highlight SpellCap guifg=#ffc453 guibg=#000000 ctermfg=2 ctermbg=5

"highlight Comment        xxx ctermfg=14 guifg=#80a0ff
"highlight Constant       xxx ctermfg=13 guifg=#ffa0a0
"highlight Special        xxx ctermfg=224 guifg=Orange
"highlight Statement      xxx ctermfg=11 gui=bold guifg=#ffff60
"highlight PreProc        xxx ctermfg=81 guifg=#ff80f
"highlight Underlined     xxx cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
"highlight Ignore         xxx ctermfg=0 guifg=bg
"highlight Todo           xxx ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
"highlight Character      xxx links to Constant
"highlight Boolean        xxx links to Constant
"highlight Float          xxx links to Number
"highlight Function       xxx links to Identifier
"highlight Conditional    xxx links to Statement
"highlight Repeat         xxx links to Statement
"highlight Label          xxx links to Statement
"highlight Keyword        xxx links to Statement
"highlight Exception      xxx links to Statement
"highlight Include        xxx links to PreProc
"highlight Define         xxx links to PreProc
"highlight Macro          xxx links to PreProc
"highlight PreCondit      xxx links to PreProc
"highlight StorageClass   xxx links to Type
"highlight Structure      xxx links to Type
"highlight Typedef        xxx links to Type
"highlight Tag            xxx links to Special
"highlight SpecialComment xxx links to Special


" KEYBOARD
let g:mapleader = '$'

nnoremap <leader><Space> :nohlsearch<CR>

nnoremap <leader>d :bnext<CR>
nnoremap <leader>z :enew<CR>
nnoremap <leader>q :bprevious<CR>
nnoremap <leader>s :bd<CR>

nnoremap <leader>e :wincmd w<CR>
nnoremap <leader>r :vsplit<CR>
nnoremap <leader>t :wincmd o<CR>
nnoremap <Tab> :NERDTreeToggle<CR>

nnoremap <leader>é :set number!<CR>

" LSP
let g:lsp_fold_enabled = 0
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

" VIM WORKSPACE (SESSION MANAGER)
let g:workspace_autosave_always = 1
let g:workspace_persist_undo_history = 0
let g:workspace_create_new_tabs = 0
let g:workspace_session_name = '.session.vim'



" AIRLINE (STATUS BAR & THEME)
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#syntastic#enabled = 1


" NEOFORMAT (FORMATTING)
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1


"Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
nnoremap <leader>a :SyntasticCheck<CR>


let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": ["python", "ruby", "php", "rust", "c", "bash", "c++"],
    \ "passive_filetypes": ["puppet"] }

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
nnoremap <F2> :TagbarToggle<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" Rust
let g:deoplete#sources#rust#racer_binary='/home/john/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/john/.local/rustsrc/library'
autocmd filetype rust nmap <buffer> <leader>f <plug>DeopleteRustGoToDefinitionDefault
autocmd filetype rust nmap <buffer> <leader>& <plug>DeopleteRustShowDocumentation

" Python
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:jedi#completions_enabled = 0
"let g:jedi#use_splits_not_buffers = "right"

"TODO Only init jedi if filetype is Python
let g:jedi#auto_initialization=1
autocmd filetype python let g:jedi#auto_initialization=1
let g:jedi#documentation_command="<leader>&"

let g:jedi#goto_command = "<leader>f"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_stubs_command = ""
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""
let g:syntastic_python_checkers = ["pylint"]
"let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_python_pylint_args = '-j4 -E --enable=R1714,W0621,W0612'
let g:jedi#show_call_signatures=0


highlight SyntasticErrorLine guifg=#ff5353 gui=bold
highlight SyntasticErrorSign guifg=#ff5353 gui=bold
highlight SyntasticError guifg=#ff5353 guibg=NONE gui=bold

"highlight SyntasticWarningLine guifg=#ffc453 gui=italic
highlight SyntasticWarningSign guifg=#ffc453 gui=italic
highlight SyntasticWarning guifg=#ffc453 guibg=NONE gui=bold
