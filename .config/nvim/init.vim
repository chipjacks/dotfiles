
""" PLUGINS ++++++++++++++++++++++++++++++++++++++++++++++++

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'

Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'stefandtw/quickfix-reflector.vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ElmCast/elm-vim'
Plug 'AlessandroYorba/Sierra'
Plug 'sjl/vitality.vim'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

" Use ag (the silver searcher) instead of ack with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" Don't use elm-vim keybindings
let g:elm_setup_keybindings = 0

" Preview hunk changes with GitGutter
set updatetime=100
" Don't use floating window because it hides line overflow
let g:gitgutter_preview_win_floating = 0
" preview, stage, and undo hunks with
" <leader>hp
" <leader>hs
"
" <leader>hu


""" SETTINGS +++++++++++++++++++++++++++++++++++++++++++++++

let g:sierra_Sunset = 1
colorscheme sierra 

"" Autosave on buffer switch
"" FocusLost/Gained needs vitality.vim installed to work in iTerm
autocmd BufLeave,FocusLost * silent! wall
autocmd FocusGained * checktime

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

" Match 'FilePicker' when I search 'filepicker'
set ignorecase

" Don't match 'filePicker' when I search 'FilePicker'
set smartcase



""" SHORTCUTS +++++++++++++++++++++++++++++++++++++++++++++

" Skip the <C-w> when switching windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Explore current directory
nmap <Leader>. :e %:p:h<CR>

" Use visual mode selection for find and replace
vnoremap <C-r> "hy:.,$s/<C-r>h//gc<left><left><left>

" Save and quit
map <C-s> :w<CR>
map <C-q> :q<CR>

" Open current file in new tab
nmap <C-t> :tabnew %<CR>

map <C-a> :Ack 

" List open buffers
nmap <C-b> :ls <CR>:b 

" Open Gstatus window height
map <C-g> :15Gstatus<CR>

" Open file with fzf
map <C-f> :GFiles<CR>

""" FILETYPE SETTINGS ++++++++++++++++++++++++++++++++++++++

" detecting
au BufNewFile,BufRead *.md set filetype=markdown
autocmd BufWritePre *.js Prettier
autocmd BufWritePre *.jsx Prettier

" custom indentation
filetype indent on
autocmd FileType elm setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=0

" preserve window switching <c-l> behavior in netrw
autocmd filetype netrw nnoremap <buffer> <c-l> <c-w>l
