filetype off
set nocompatible

call plug#begin('~/.vim/plugged')

"   util
Plug 'garbas/vim-snipmate'
Plug 'guns/xterm-color-table.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'msanders/cocoa.vim'
Plug 'phildawes/racer'
Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/JavaScript-Indent'
"   syntax
Plug 'Blackrush/vim-gocode'
Plug 'cespare/vim-toml'
Plug 'elixir-lang/vim-elixir'
Plug 'groenewege/vim-less'
Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-haml'
Plug 'vim-scripts/VimClojure'
Plug 'vim-scripts/vim-coffee-script'
Plug 'vim-scripts/jade.vim'
Plug 'vim-scripts/JSON.vim'
Plug 'vim-scripts/php.vim-for-php5'
Plug 'vim-scripts/vim-stylus'
Plug 'wting/rust.vim'

Plug 'davidglivar/vim-sinner'

call plug#end()

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

syntax on
set t_Co=256
colorscheme sinner

autocmd! BufWritePost sinner.vim source %
autocmd CompleteDone * pclose

autocmd FileType c setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

let mapleader=","

"   general settings
set ai
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set cursorcolumn
set expandtab
set fillchars=vert:▒
set grepprg=ack
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set numberwidth=5
set shiftwidth=2
set showmatch
set smartcase
set smarttab
set so=7
set softtabstop=2
set tabstop=2
set visualbell

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

match OverLength /\%81v.\+/

"  Put useful info in status line
set statusline=\ %<%f\ (%{&ft})%=#%n\ %l/%L,%c%V\

"  Show line numbers
set number
set relativenumber
set numberwidth=5

"  Expand history
set history=1000

"   Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"   HTML glitch
let html_no_rendering=1

"   mappings
noremap <C-c> <Esc>
map <Leader>w :w<cr>
map <Leader>so :so ~/.vimrc<cr>

"   toggle paste mode
noremap = :set invpaste paste?<cr>
set pastetoggle=<F2>
set showmode

"   Select and Copy a line
nnoremap Y Vy

"   Add a line above/below without entering insert mode
nnoremap <c-o> :put =''<cr>
nnoremap <c-i> :put! =''<cr>

"   Buffer switching
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"   for really long lines
map j gj
map k gk

"   move single lines
nnoremap K ddkP
nnoremap J ddp
nnoremap H <<
nnoremap L >>

"   moving visual mode selected text
"   move blocks
vnoremap K xkP`[V`]
vnoremap J xp`[V`]
vnoremap L >gv
vnoremap H <gv

inoremap <c-k> <Up>
inoremap <c-j> <Down>
inoremap <c-h> <Left>
inoremap <c-l> <Right>

"   ctrl p
let g:ctrlp_map = "<leader>t"
nnoremap <leader>y :CtrlPMRU<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = {
 \ "dir":  "\.git$\|\.hg$\|\.svn$|node_modules$",
 \ "file": "\.app$\|\.so$\|\.pyc$\$"
 \ }

"   Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')
endfunc

let $LOCALFILE=expand("~/.vimrc.local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

let g:racer_cmd ="/usr/local/src/racer/target/release/racer"
let $RUST_SRC_PATH="/usr/local/src/rustc/src/"
