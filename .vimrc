" Vimrc
" Chip Jackson

" no compatibility with legacy vim
set nocompatible

" load Vundle """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'Solarized'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
" Plugin 'Syntastic'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlighting
syntax enable

" Use the solarized colorscheme
" set background=light
" colorscheme solarized

" Tells Vim which syntax highlighting to use
set background=light

" Show line numbers
set number

" Highlight text column
" set colorcolumn=81

" allows tabbing through files to open
set wildmenu

" Filetypes that get lower priority in wildmenu
set suffixes-=.So,.so.1
set suffixes+=.So,.so.1

" utf-8 encoding
set encoding=utf-8

" Show typed command in statusbar
set showcmd

" Shows location in file at bottom right
set ruler 

" Don't beep at me
set visualbell

""" Indentation
" Hard tabs
" set noexpandtab
" set softtabstop=0 " (off)
" set shiftwidth=2
" set tabstop=2

" Soft tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" Just copy indentation from last line and I'll take care of the rest
set autoindent

" More clever version of smartindent for autoindenting code
" set cindent

" Load indent-expression based on filetype
" filetype indent on

" Custom filetype indentation widths
" autocmd FileType css setlocal shiftwidth=2 tabstop=2
" autocmd FileType cpp setlocal shiftwidth=4 tabstop=4
" autocmd FileType html setlocal shiftwidth=2 tabstop=2
" autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 textwidth=80
" autocmd FileType python setlocal shiftwidth=2 tabstop=2
" autocmd FileType tex setlocal shiftwidth=4 tabstop=4 textwidth=80
" autocmd FileType txt setlocal shiftwidth=2 tabstop=2 textwidth=80
" autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
" autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
" autocmd FileType php setlocal shiftwidth=2 tabstop=2

" Comment blocks of code using ,cc
au BufRead,BufNewFile *.coffee		setfiletype coffeescript
autocmd FileType c,cpp,java,scala,javascript let b:comment_leader = '// '
autocmd FileType sh,ruby,python,coffeescript let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType html              let b:comment_leader = '// '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"" Autosave everything when window loses focus
:au FocusLost * :wa

"" Autosave on buffer switch
set autowrite

" Let lines go off edge of view without wrapping
set nowrap

" Use the same symbols as TextMate for tabstops and EOLs when I do :set list
set listchars=tab:▸\ ,eol:¬

" Use Solaried base2 color for tabs, spaces, and eol's
highlight NonText guifg=#93a1a1
highlight SpecialKey guifg=#93a1a1

""" Searching
" highlight matches
set hlsearch

" hide any highlighted matches
nohl

" Highlight matches as pattern is typed
set incsearch

" Searches are case insensitive
set ignorecase

" Searches are case sensitive if they contain a capital letter
set smartcase

" Shortcut allowing you to skip the <C-w> when switching windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Expand %% to directory of file your currently editing
cabbr <expr> %% expand('%:p:h')

" Use visual mode selection for find and replace
vnoremap <C-r> "hy:.,$s/<C-r>h//gc<left><left><left>
