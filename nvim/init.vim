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

" [auto_pairs_]
" Plugin to help with parantheses
" https://github.com/jiangmiao/auto_pairs.vim
Plug 'jiangmiao/auto-pairs'

" [bufferline_]
" Plugin to list the buffers in vim
" https://github.com/bling/vim-bufferline
Plug 'bling/vim-bufferline'

" [deoplete_]
" Plugin for async completion
" https://github.com/Shougo/deoplete.nvim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" [easymotion_]
" Plugin to move faster in code
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

" [file_line_]
" Plugin to open files at a given line number
" https://github.com/bogado/file-line
Plug 'bogado/file-line'

" [fugitive_]
" Plugin for commiting directly from vim
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" [fzf_]
" Plugin for fuzzy file finding
" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-bash --no-zsh' }
Plug 'junegunn/fzf.vim'

" [gitgutter_]
" Plugin to show git diffs in a gutter
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" [grammarous_]
" Plugin to check grammar in text
" https://github.com/rhysd/vim-grammarous
Plug 'rhysd/vim-grammarous'

" [gruvbox_]
" Plugin for the color scheme
" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" [julia_]
" Plugin to help with word usuage
" https://github.com/JuliaEditorSupport/julia-vim
Plug 'JuliaEditorSupport/julia-vim'

" [lightline_]
" Plugin for footer colorizer
" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" [markdown_]
" Plugin for markdown syntaxing
" https://github.com/plasticboy/vim-markdown
Plug 'plasticboy/vim-markdown'

" [neoformat_]
" Plugin for formatting code
" https://github.com/sbdchd/neoformat
Plug 'sbdchd/neoformat'

" [neosnippet_]
" Plugin for adding snippets
" https://github.com/Shougo/neosnippet
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" [nerdcommenter_]
" Plugin with keybindings for rapid commenting
" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

" [online_thesaurus_]
" Plugin to access thesaurus from vim
" https://github.com/beloglazov/vim-online-thesaurus
Plug 'beloglazov/vim-online-thesaurus'

" [repeat_]
" Plugin to repeat any last command
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" [startify_]
" Plugin for a fancy startup screen
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" [surround_]
" Plugin to change words between brackets, parantheses, etc
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" [tabularize_]
" Plugin to for aligning lines around a character
" https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular'

" [tagbar_]
" Plugin to display program hierarchy
" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'

" [tex_]
" Plugin for latex compilation
" https://github.com/lervag/vimtex
Plug 'lervag/vimtex'

" [wordy_]
" Plugin to help with word usuage
" https://github.com/reedes/vim-wordy
Plug 'reedes/vim-wordy'
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
let tex_files = ['latex', 'tex', 'plaintex']
au! BufEnter * if index(tex_files, &ft) < 0 | set tw=79
au! BufEnter * if index(tex_files, &ft) < 0 | set fo+=t
au! TabEnter * if index(tex_files, &ft) < 0 | set tw=79
au! TabEnter * if index(tex_files, &ft) < 0 | set fo+=t
au! TabNewEntered * if index(tex_files, &ft) < 0 | set tw=79
au! TabNewEntered * if index(tex_files, &ft) < 0 | set fo+=t

" Make launch/world files xml type
au BufNewFile,BufRead,TabEnter,TabNewEntered *.launch set filetype=xml
au BufNewFile,BufRead,TabEnter,TabNewEntered *.world set filetype=xml

" Remove whitespace automatically
autocmd BufWritePre * :%s/\s\+$//e
" }}}

" Tabs and Spaces {{{
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

au FileType python setl ts=2 sts=2 sw=2 et
au FileType julia setl ts=4 sts=4 sw=4 et
au FileType latex setl ts=4 sts=4 sw=4 et
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

" [deoplete_] [neosnippet_] [auto_pairs_] {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#custom#auto_complete_start_length = 1
let g:deoplete#custom#enable_smart_case = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snips'
let g:AutoPairsMapCR=0
" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"
" }}}

" [fzf_] {{{
let g:fzf_nvim_statusline = 0 " disable statusline overwriting

nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>. :AgIn

nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>

function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction

function! SearchWithAgInDirectory(...)
  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction
command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
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

" [markdown_] {{{
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 4
" }}}

" [neoformat_] {{{
nmap <F9> :Neoformat<CR>
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

" [startify_] {{{
let g:startify_bookmarks = [
                      \ '~/.config/nvim/init.vim',
                      \ '~/.bashrc',
                      \ '~/.gitconfig',
                      \ '~/.zshrc',
                      \ ]

" Open Startify in new tab
:nnoremap <leader><leader>s :tabe %<CR>:Startify<CR>
" }}}

" [tagbar_] {{{
nmap <F8> :TagbarToggle<CR>
" }}}

" [tex_] {{{
let g:tex_flavor = 'latex'

if !exists('g:deoplete#custom#omni#input_patterns')
    let g:deoplete#custom#omni#input_patterns = {}
endif
let g:deoplete#custom#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ .')'
" }}}

" Keybindings {{{
" Esc remapping
inoremap jj <esc>

" Turn off auto-indent while pasting
set pastetoggle=<F2>

" Open a buffer in new tab
nnoremap <leader>t :tabnew

" Open file under cursor in a new tab
nnoremap gf <c-w>gf

" Visual line movement
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Move between splits
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

" xclip mapping
:map <F3> :w !xclip -selection clipboard<CR><CR>

" Disable ex mode
:map Q <Nop>

" Remap W to w in commands
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Open terminal in newtab
:nnoremap <leader><leader>t :tabe term://.//zsh<CR><Insert>
" Esc to leave terminal mode
:tnoremap <Esc> <C-\><C-n>
" }}}

" vim:foldmethod=marker:foldlevel=0
