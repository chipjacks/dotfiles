
""" PLUGINS ++++++++++++++++++++++++++++++++++++++++++++++++

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'stefandtw/quickfix-reflector.vim'

Plug 'ElmCast/elm-vim'
Plug 'AlessandroYorba/Sierra'
call plug#end()

" Use ag (the silver searcher) instead of ack with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'
map <C-a> :Ack 

" Don't use elm-vim keybindings
let g:elm_setup_keybindings = 0

" Preview hunk changes with GitGutter
set updatetime=100
" preview, stage, and undo hunks with
" <leader>hp
" <leader>hs
" <leader>hu



""" SETTINGS +++++++++++++++++++++++++++++++++++++++++++++++

let g:sierra_Sunset = 1
colorscheme sierra 

"" Autosave on buffer switch
autocmd BufLeave,FocusLost * silent! wall

" Don't beep at me
set visualbell

" Soft tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" Just copy indentation from last line and I'll take care of the rest
set autoindent

" Don't wrap lines when they get too long
set nowrap



""" SHORTCUTS +++++++++++++++++++++++++++++++++++++++++++++

" Skip the <C-w> when switching windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Explore current directory
nmap <Leader>. :e %:p:h<CR>

" Use visual mode selection for find and replace
vnoremap <C-r> "hy:.,$s/<C-r>h//gc<left><left><left>

" Save and quit
map <C-s> :w<CR>
map <C-q> :wq<CR>


""" FILETYPE SETTINGS ++++++++++++++++++++++++++++++++++++++

" detecting
au BufNewFile,BufRead *.md set filetype=markdown

" custom indentation
filetype indent on
autocmd FileType elm setlocal shiftwidth=4 tabstop=4 softtabstop=4
