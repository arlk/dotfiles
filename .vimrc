" Arun Lakshmanan

" Vundle Setup {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" }}}

" Vundle Packages {{{

" [fugitive_]
" Plugin for commiting directly from vim
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

" [latex_box_]
" Plugin for latex compilation
" https://github.com/LaTeX-Box-Team/LaTeX-Box
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" [auctex_]
" Plugin for latex macros
" http://www.vim.org/scripts/script.php?script_id=162
Plugin 'auctex.vim'

" [gitgutter_]
" Plugin to show git diffs in a gutter
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" [airline_]
" Plugin to create the header and footer bar + many more
" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" [nerdcommenter_]
" Plugin with keybindings for rapid commenting
" https://github.com/scrooloose/nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" [ctrlp_]
" Plugin for fuzzy file search
" https://github.com/kien/ctrlp.vim
Plugin 'kien/ctrlp.vim'

" [bufferline_]
" Plugin to list the buffers in vim
" https://github.com/bling/vim-bufferline
Plugin 'bling/vim-bufferline'

" [supertab_]
" Plugin to for tab completing in insert mode
" https://github.com/ervandew/supertab
Plugin 'ervandew/supertab'

" [gruvbox_]
" Plugin for the color scheme
" https://github.com/morhetz/gruvbox
Plugin 'morhetz/gruvbox'

" [ack_]
" Plugin to search files recursively using ack
" https://github.com/mileszs/ack.vim
Plugin 'mileszs/ack.vim'

" }}}

" Vundle End {{{
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Colors {{{
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif
syntax enable

" [gruvbox_]
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
" }}}

" File Settings {{{
" File encoding
set encoding=utf-8

" Move backups to /tmp folder"
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Line wrapping after 79 characters "
:set tw=79
:set fo+=t

" Remove whitespace automatically "
autocmd BufWritePre * :%s/\s\+$//e
" }}}

" Tabs and Spaces {{{
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
" }}}

" Vim Appearance and other settings {{{
" Show line numbers and cursor
set number
set showcmd
set cursorline

" Makes vim load faster
set lazyredraw

" Highlights matching braces
set showmatch

" Disable bell "
set vb
" }}}

" Wildmenu {{{
" Vim filename completion
set wildmenu
set wildignorecase

" Vim ignores these filetypes
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
" }}}

" Search {{{
" Keyword search settings
set incsearch
set hlsearch
set ic
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Fold {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent
" }}}

" [airline_] {{{
let g:airline_powerline_fonts =1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
" }}}

" Keybindings {{{
" Esc remapping
inoremap jj <esc>
" Select text written last time in insert mode
nnoremap gV `[v`]
" Turn off auto-indent while pasting
set pastetoggle=<F2>
" Open a buffer in new tab
nnoremap <leader>t :tabnew
" }}}

" vim:foldmethod=marker:foldlevel=0
