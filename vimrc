version 6.0

" Plugin manager: vim-plug
" See: https://github.com/junegunn/vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
" Sensible defaults
Plug 'tpope/vim-sensible'
" ALE: Syntax checking and semantic errors
Plug 'dense-analysis/ale'
" ansible-vim
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
" YouCompleteMe: A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'
" NERDTree: File system explorer for the Vim
Plug 'preservim/nerdtree'
" Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" SimpylFold: Simple, correct folding for Python
Plug 'tmhedberg/SimpylFold'
" Better python indention
Plug 'Vimjas/vim-python-pep8-indent'
" CTRLP: Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plug 'ctrlpvim/ctrlp.vim'
" Habamax theme
Plug 'habamax/vim-habamax'
" TOML syntax file (might be usefull for Sanoid ZFS snapshoting).
Plug 'cespare/vim-toml', { 'branch': 'main' }

"
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <C-U> u
map Q gq
nmap gx <Plug>NetrwBrowseX
vmap gx <Plug>NetrwBrowseXVis
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set display=truncate
set fileencodings=ucs-bom,utf-8,latin1
set history=200
set hlsearch
set incsearch
set langnoremap
set nolangremap
set makeprg=gmake
set mouse=a
set nrformats=bin,hex
set ruler
set scrolloff=5
set shiftwidth=4
set showcmd
set smartindent
set smarttab
set ttimeout
set ttimeoutlen=100
set wildmenu

" Changes by df
set cursorline
set number
set hlsearch
set t_Co=256
colorscheme habamax

" Folding
set foldmethod=indent
set foldlevel=99

autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YAML Files
autocmd BufNewFile,BufRead,Filetype yml,yaml setlocal cursorcolumn

" Allow Modelines in files
set modeline
set modelines=5

"
" Plugin configuration
" 
" ALE: Syntax checking and semantic errors
let g:ale_linters = {'python': ['flake8']}

" YouCompleteMe: a code-completion engine for Vim

" NERDTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" SimpylFold
let g:SimpylFold_docstring_preview = 1

"
" Key mappings
"
let g:mapleader = "\<space>"
" Folding
"nnoremap <space> za
nnoremap <leader><leader> za
" NERDTree Key mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Split key mappings
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Force saving files that require root permission 
cnoremap w!! w !sudo tee > /dev/null %

" vim: set ft=vim :
