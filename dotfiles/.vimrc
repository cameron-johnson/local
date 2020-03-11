"  VimTK Recommended VimRC: 
" References: https://github.com/Erotemic/vimtk

"""""""""""""""
" # Install vim-plug into your autoload directory
" " See: https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"""""""""""""""
set nocompatible
filetype off
" source $VIMRUNTIME/mswin.vim
" behave mswin
set encoding=utf8

" Try to get autoload to work
set runtimepath+=~/.vim/bundle/
set runtimepath+=~/.vim/bundle/vimtk
set runtimepath+=~/.vim/bundle/vimtk/autoload
" ~/.vim/bundle/vimtk/autoload/vimtk.vim

call plug#begin('~/.vim/bundle')

Plug 'sjl/badwolf'
Plug 'Erotemic/vimtk'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'

call plug#end()            " required

filetype plugin indent on
syntax on

"""" The above code should be among the first things in your vimrc

scriptencoding utf-8
set encoding=utf-8

" allow backspacing over everything in insert mode
"set backspace=indent,eol,start

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
    "set mouse=a
"endif

"set fileformat=unix
"set fileformats=unix,dos

" colorscheme badwolf

"set nomousehide


"set shellslash
"set grepprg=grep\ -nH\ $*

"set autoread
"set ruler

" References: https://vi.stackexchange.com/questions/13034/automatic-whitespace-in-python
" ---- Minimal configuration:
set smartindent   " Do smart autoindenting when starting a new line
set shiftwidth=4  " Set number of spaces per auto indentation
set expandtab     " When using <Tab>, put spaces instead of a <tab> character

" ---- Good to have for consistency
set tabstop=4   " Number of spaces that a <Tab> in the file counts for
set smarttab    " At <Tab> at beginning line inserts spaces set in shiftwidth

" Highlight search regexes
set incsearch
set hlsearch


" https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
" fix terminal spacing issue
"set t_BE=

"set cino='{1s'

" Map your leader key to comma (much easier to hit)
let mapleader = ","
let maplocalleader = ","
noremap \ ,

" Search and replace under cursor
noremap <leader>ss :%s/\<<C-r><C-w>\>/
"Surround word with quotes
noremap <leader>qw ciw'<C-r>"'<Esc>
noremap <leader>qc ciw`<C-r>"`<Esc>

" Window navication
" Alt + jklh
map <silent><A-j> <c-w>j
map <silent><A-k> <c-w>k
map <silent><A-l> <c-w>l
map <silent><A-h> <c-w>h
" Control + jklh
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
" Move in split windows
" Press leader twice to move between windows
noremap <leader>, <C-w>w
map <c-h> <c-w>h

" Fast nerd tree access
noremap <leader>. :NERDTree<CR>
noremap <leader>h :NERDTreeToggle<CR>
"noremap <leader>h :Tlist<CR>
noremap <leader>j :Tagbar<CR>

" set autochdir
" better version of autochdir that changes cwd to be at the current
" file
autocmd BufEnter * silent! lcd %:p:h

source $HOME/.vim/bundle/vimtk/plugin/vimtk.vim



" Make default vimtk remaps
":call VimTK_default_remap()

" Swap colon and semicolon
" source ~/.vim/bundle/vimtk/autoload/vimtk.vim

" :call vimtk#swap_keys(':', ';')
" :call vimtk#helloworld()

" Register files you use all the time with quickopen
" (use <leader>i<char> as a shortcut to specific files

"call vimtk#quickopen(',', '~/.vimrc')
"call vimtk#quickopen('5', '~/.bashrc')

let g:syntastic_python_checkers = ['flake8']
