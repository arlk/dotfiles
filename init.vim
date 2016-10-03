" Arun Lakshmanan

" Nvim begin {{{
set nocompatible              " be iMproved, required
filetype plugin indent on    " required
" }}}

" Plug Initialize {{{
call plug#begin('~/.vim/plugged')
" }}}

" Plug Packages {{{
" [ack_]
" Plugin to search files recursively using ack
" https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'

" [auctex_]
" Plugin for latex macros
" http://www.vim.org/scripts/script.php?script_id=162
Plug 'auctex.vim'

" [bufferline_]
" Plugin to list the buffers in vim
" https://github.com/bling/vim-bufferline
Plug 'bling/vim-bufferline'

" [ctrlp_]
" Plugin for fuzzy file search
" https://github.com/kien/ctrlp.vim
Plug 'kien/ctrlp.vim'

" [fugitive_]
" Plugin for commiting directly from vim
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" [gitgutter_]
" Plugin to show git diffs in a gutter
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" [gruvbox_]
" Plugin for the color scheme
" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" [latex_box_]
" Plugin for latex compilation
" https://github.com/LaTeX-Box-Team/LaTeX-Box
Plug 'LaTeX-Box-Team/LaTeX-Box'

" [lightline_]
" Plugin for footer colorizer
" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" [nerdcommenter_]
" Plugin with keybindings for rapid commenting
" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

" [startify_]
" Plugin for a fancy startup screen
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" [supertab_]
" Plugin to for tab completing in insert mode
" https://github.com/ervandew/supertab
Plug 'ervandew/supertab'
" }}}

" Plug End {{{
" All of your Plugins must be added before the following line
call plug#end()            " required
" }}}

" Colors {{{
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif
syntax enable
" }}}

" File Settings {{{
" File encoding
set encoding=utf-8
scriptencoding utf-8

" Move backups to /tmp folder
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Line wrapping after 79 characters
:set tw=79
:set fo+=t

" Remove whitespace automatically
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

" Always show status line
set laststatus=2
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

" [ctrp_] {{{
" Switch what <cr> in ctrp results box does
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
" }}}

" [gruvbox_] {{{
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
" }}}

" [lightline_] {{{
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '--'.branch : ''
  endif
  return ''
endfunction

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "x"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
" }}}

" [nerdcommenter_] {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
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
" Open file under cursor in a new tab
nnoremap gf <c-w>gf
" }}}

" vim:foldmethod=marker:foldlevel=0
