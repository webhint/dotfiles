set nocompatible               " be iMproved

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

silent! runtime bundles.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------

filetype plugin indent on     
let mapleader = ","
let g:mapleader = ","
set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
syntax enable
set autoread

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------

set title
set encoding=utf-8
set ffs=unix,mac,dos
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
" set relativenumber
set undofile

" Auto adjust window sizes when they become current
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

colorscheme wombat256
set t_Co=256

"statusline setup
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set binary        " resolved no end of line git thing
set nowrap
set textwidth=79
set formatoptions=n

"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------

" Saving and exit
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

" save shortcut
noremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

" Map ESC
imap jj <ESC>

"Move a line of text using Ctrl+[jk]
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" select everything
noremap <C-a> ggVG

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" turn search highlight off
nnoremap <leader><space> :noh<cr> 
" search (forwards)
nmap <space> /
" search (backwards)
map <c-space> ?
" find/replace shortcut
noremap <leader>f :%s///gc<left><left><left><left>

" Auto format
map === mmgg=G`m^zz

" edit .vimrc
command! Ev :e ~/.vimrc
command! Eb :e ~/.vim/bundles.vim

" Copy paste in/out of vim
noremap <C-c> "+y
noremap <C-v> "+p
imap <C-c> <esc>"+y 
imap <C-v> <esc>"+p 

" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e

" Use Ack instead of Grep when available
if executable("ack-grep")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  nnoremap <leader>a :Ack 
endif

" Spell checking
set spellfile+=~/.vim/spell/en.utf-8.add
set dict+=~/.vim/spell/en.utf-8.add
noremap <leader>ss :setlocal spell!<cr>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>sd z=

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
" close buffer
nmap <leader>d :bd<CR>
" close all buffers
nmap <leader>D :bufdo bd<CR>

" Switch between last two buffers
nnoremap <leader><leader> <c-^>

"  ---------------------------------------------------------------------------
"  Function Keys
"  ---------------------------------------------------------------------------

" F1 - toggle wordwrap
map <F1> :set nowrap! <CR>

" F2 - NERDTree
noremap <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50 
let NERDTreeIgnore=['\.git$','\.sass-cache']

" F3 - YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" F4 - kwdb.vim
nmap <F4> <Plug>Kwbd

" F5 - Terminal
map <F5> :ConqueTerm zsh<CR>

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" Ruby
map <Leader>1 <Plug>RubyTestRun
map <Leader>2 <Plug>RubyFileRun
map <Leader>3 <Plug>RubyTestRunLast

" Rails
let g:rails_menu=2
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
" map <Leader>m :Rmodel<space>
" map <Leader>c :Rcontroller<space>
" map <Leader>v :Rview<space>
" map <Leader>sm :RSmodel
" map <Leader>sc :RScontroller
" map <Leader>sv :RSview
" map <Leader>su :RSunittest
" map <Leader>sf :RSfunctionaltest
" View routes or Gemfile in large split
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
" Skip to Models and Views
map <Leader>m :Rmodel 
map <Leader>v :Rview 

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" Command-T
" find file
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
let g:CommandTMatchWindowAtTop=1 " show window at top
let g:CommandTMaxHeight=20
set wildignore+=*.o,*~,*.obj,.git/**,vendor/**,tmp/**,app/assets/images/**,public/images/**,public/assets/**
set wildignore+=*.class,*.doc,*.lock,**.png,**.jpg,**.jpeg
set wildignore+=*.sass-cache/**,build/**

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Git integration
noremap <leader>8 :e! Gemfile \| Gstatus<CR>
noremap <leader>9 :Gcommit<CR>

" Supertab
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1

" tComment
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

nmap <leader>s :ToggleWord<CR> 

" Buffer window (find file in open buffers)
nmap <silent> <leader>b :FufBuffer<CR>

" Use only current file to autocomplete from tags
set complete=.,w,b,u,t,i

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'} 
let g:AutoCloseProtectedRegions = ["Character"] 

let my_home = expand("$HOME/")
if filereadable(my_home . '.vim/bundle/vim-autocorrect/autocorrect.vim')
  source ~/.vim/bundle/vim-autocorrect/autocorrect.vim
endif

"  ---------------------------------------------------------------------------
"  GUI
"  ---------------------------------------------------------------------------

if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA 
  set mouse=v
  set guifont=Monaco:h12 "<- Maybe a good idea when using mac
endif
set guifont=Monaco:h12

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------

set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/sh

" Finally, load custom configs
if filereadable(my_home . '.vimrc.local')
  source ~/.vimrc.local
endif

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" When vimrc is edited, reload it
autocmd bufwritepost vimrc source ~/.vimrc
