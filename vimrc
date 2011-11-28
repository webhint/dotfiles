set nocompatible               " be iMproved
"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "git://github.com/mileszs/ack.vim.git"
Bundle "git://github.com/tpope/vim-fugitive"
Bundle "git://github.com/tpope/vim-rails.git"
Bundle "git://github.com/tpope/vim-surround.git"
Bundle "git://github.com/chrismetcalf/vim-yankring.git"
Bundle "git://github.com/tpope/vim-endwise.git"
Bundle "git://github.com/Townk/vim-autoclose.git"
Bundle "git://github.com/panozzaj/vim-autocorrect.git"
Bundle "git://github.com/tsaleh/vim-tcomment.git"
Bundle "git://github.com/clones/vim-fuzzyfinder.git"
Bundle "git://github.com/godlygeek/tabular.git"
Bundle "http://github.com/mattn/gist-vim"
Bundle "git://github.com/vim-scripts/L9.git"
Bundle "git://github.com/rson/vim-conque.git"
Bundle "git://github.com/gmarik/snipmate.vim.git"
Bundle "git://github.com/kana/vim-textobj-user.git"
Bundle "git://github.com/nelstrom/vim-textobj-rubyblock.git"
Bundle "git://github.com/janx/vim-rubytest.git"
Bundle "git://github.com/scrooloose/syntastic.git"
Bundle "git://github.com/msanders/snipmate.vim.git"
Bundle "git://github.com/ervandew/supertab.git"
Bundle "git://github.com/scrooloose/nerdtree.git"
Bundle "git://git.wincent.com/command-t.git"
Bundle "Color-Sampler-Pack"
Bundle "toggle_words.vim"
Bundle 'vim-coffee-script'

filetype plugin indent on     " and turn it back on!

runtime macros/matchit.vim

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
set vb

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
set wildmode=list:longest,list:full
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile

colorscheme wombat256
set t_Co=256

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

"statusline setup
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set expandtab
set list!
if has("gui_running")
  set listchars=tab:»·,trail:·
else
  set listchars=tab:\ \ ,trail:-
endif

set nowrap
set textwidth=79
" set formatoptions=n

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
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
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
command! Eg :e ~/.gvimrc

" Copy paste in/out of vim
noremap <C-c> "+y
noremap <C-v> "+p
imap <C-c> <esc>"+y 
imap <C-v> <esc>"+p 

" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e

" Use Ack instead of Grep when available
if executable("ack")
  let g:ackprg="ack -H --nocolor --nogroup --column"
  nnoremap <leader>a :Ack 
	nnoremap <leader>A :Ack <cword><CR> 
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

" F2 - Terminal
" ConqueTerm wrapper
function! StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \
endfunction
map <F2> :call StartTerm()<CR>

" F3 - YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" F4 - kwdb.vim
nmap <F4> <Plug>Kwbd

" F6 - Trim trailing whitespace
nmap <F6> :%s/\s*$//<CR>:noh<CR>

"  ---------------------------------------------------------------------------
"  #Ruby
"  ---------------------------------------------------------------------------

" testing
map <Leader>1 <Plug>RubyTestRun
map <Leader>2 <Plug>RubyFileRun
map <Leader>3 <Plug>RubyTestRunLast

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" Rails
let g:rails_menu=2
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
" map <Leader>sm :RSmodel
" map <Leader>sc :RScontroller
" map <Leader>sv :RSview
" map <Leader>su :RSunittest
" map <Leader>sf :RSfunctionaltest
" View routes or Gemfile in large split
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft :vsplit Gemfile<cr>
" Skip to Models and Views

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 0
let NERDTreeWinSize = 30
let NERDTreeIgnore=['\.git$','\.sass-cache']

" yankring
let g:yankring_history_dir = '$VIM'

" vim-autoclose
if !has("gui_running")
  let g:AutoClosePreservDotReg = 0
endif

" Command-T
" find file
map <leader>t :CommandTFlush<cr>\|:CommandT<cr>
let g:CommandTMatchWindowAtTop=1 " show window at top
let g:CommandTMaxHeight=20
set wildignore+=*.o,*~,*.obj,.git/**,tmp/**,app/assets/images/**,public/images/**,public/assets/**
set wildignore+=*.class,*.doc,*.lock,**.png,**.jpg,**.jpeg
set wildignore+=*.sass-cache/**,build/**
set wildignore+=doc/**,rdoc/**

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

" toggle words/bool/int
nmap <leader>s :ToggleWord<CR> 

" NERDTree
noremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 40 
let NERDTreeIgnore=['\.git$','\.sass-cache']


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
  set mouse=a
  set guifont=Monaco:h12 "<- Maybe a good idea when using mac
  set antialias
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
autocmd BufWritePost .vimrc source $MYVIMRC
