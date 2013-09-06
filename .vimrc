set wildmenu			" allows tabbing through files to open
set suffixes-=.So,.so.1
set suffixes+=.So,.so.1

set nocompatible		" no compatibility with legacy vim
syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on
set number
set colorcolumn=81
set background=dark

"" Whitespace
set nowrap
set tabstop=4 shiftwidth=4

"" Searching
set hlsearch 	" highlight matches, to unhighlight ':nohl'
set incsearch	" highlight matches as pattern is typed
set ignorecase	" searches are case insensitive
set smartcase	" ...unless they contain at least 1 capital letter

" Switching windows shortcut
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"" Vundle
source ~/.vim/vundle.vim

"" For solarized
set g:solarized_contrast="high"
colorscheme solarized

"" For Cscope
source ~/.vim/cscope_maps.vim
map <C-Space> <C-@>
vnoremap <C-r> "hy:.,$s/<C-r>h//gc<left><left><left>

"" SmoothScrolling for Ctrl-U and Ctrl-D
function! SmoothScroll(up)
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 2m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i
