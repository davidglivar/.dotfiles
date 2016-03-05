let mapleader=","

"   rust/racer config
let g:racer_cmd ="/usr/local/src/racer/target/release/racer"
let $RUST_SRC_PATH="/usr/local/src/rustc/src/"

"   Use deoplete.
let g:deoplete#enable_at_startup=1

"   HTML glitch
let html_no_rendering=1

"   Leave me alone, autopairs.
let g:AutoPairsMapBS=0

let g:gitgutter_realtime = 1

"   Plugins
call plug#begin('~/.vim/plugged')

"   util
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Shougo/deoplete.nvim'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-sort-motion'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

"   syntax
Plug 'Blackrush/vim-gocode', { 'for': 'go' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'vim-scripts/JSON.vim', { 'for': 'json' }
Plug 'vim-scripts/VimClojure', { 'for': 'closure' }
Plug 'vim-scripts/jade.vim', { 'for': 'jade' }
Plug 'vim-scripts/php.vim-for-php5', { 'for': 'php' }
Plug 'vim-scripts/vim-coffee-script', { 'for': 'coffee' }
Plug 'vim-scripts/vim-stylus', { 'for': 'stylus' }
Plug 'wting/rust.vim', { 'for': 'rust' }

"   colors
Plug 'chriskempson/base16-vim'
Plug 'davidglivar/vim-sinner'
Plug 'morhetz/gruvbox'

call plug#end()

if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set background=dark
colorscheme gruvbox

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
"
"  Show line numbers
set number
set numberwidth=6

"  Expand history
set history=1000

"   Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"   ctrl p
let g:ctrlp_map = "<leader>t"
nnoremap <leader>y :CtrlPMRU<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = {
 \ "dir":  "\.git$\|\.hg$\|\.svn$|node_modules$",
 \ "file": "\.app$\|\.so$\|\.pyc$\$"
 \ }

"   Show syntax highlighting groups for word under cursor
nmap <c-s-p> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')
endfunc

"   Gist
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

if has("pbcopy")
  let g:gist_clip_command = 'pbcopy'
elseif has("xclip")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif

"   mappings
noremap <c-c> <Esc>

map <Leader>w :w<cr>
map <Leader>so :so ~/.vimrc<cr>
map <c-n> :NERDTreeToggle<cr>

"   tabs
map <c-a>t :tabnew<cr>
map <c-a>l gt
map <c-a>h gT

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
inoremap <c-l> <Right>

"   Caveat: iterm settings
"   Edit -> Preferences -> Keys
"   Press +
"   Press Ctrl+h as Keyboard Shortcut
"   Choose Send Escape Sequence as Action
"   Type [104;5u for Esc+
inoremap <c-h> <Left>

"   Let autopairs have backspace
inoremap <buffer> <silent> <BS> <C-R>=AutoPairsDelete()<CR>

let $LOCALFILE=expand("~/.vimrc.local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
