" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-sensible.git'
Plugin 'tpope/vim-classpath.git'
Plugin 'guns/vim-clojure-static.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'lambdatoast/elm.vim.git'
Plugin 'fatih/vim-go'
" Plugin 'Shougo/neocomplcache.vim.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'rodjek/vim-puppet.git'
Plugin 'wting/rust.vim.git'
Plugin 'ervandew/supertab.git'
Plugin 'tpope/vim-surround.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'jdonaldson/vaxe.git'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'derekwyatt/vim-scala'
Plugin 'sophacles/vim-processing'
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-projectionist.git'
Plugin 'Raimondi/delimitMate'
Plugin 'zah/nimrod.vim'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

runtime macros/matchit.vim        " Load the matchit plugin.

set showmode                      " Display the mode you're in.

set encoding=utf-8                " Use UTF-8 everywhere.
set cursorline                    " highlights the current line
set hidden                        " Handle multiple buffers better.
set wildmode=list:longest         " Complete files like a shell.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set title                         " Set the terminal's title
set visualbell                    " No beeping.
set relativenumber                " shows the numbers relative at the beginning

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set undofile  " creates a persistent file with undo commands

set gdefault  " substitutions are globally in file

" let mapleader = ","  " the , is now the leader key

" nnoremap <tab> %
" vnoremap <tab> %  " move around matching pairs with tab

" UNCOMMENT TO USE
set tabstop=4                    " Global tab width.
set shiftwidth=4                 " And again, related.
set softtabstop=4
set expandtab                    " Use spaces instead of tabs

au FocusLost * :wa  " saves file when losing focus

" with Tab we can autoexpand xptemplate snippets
" https://github.com/drmingdrmer/xptemplate/wiki/FAQ
"let g:xptemplate_key = '<Tab>'

" splitting files remapping
nnoremap <leader>w <C-w>v<C-w>l  " opens new split and jump to it
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk
colorscheme Tomorrow-Night-Bright

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Set tabstop, softtabstop and shiftwidth to the same value
" call with :Stab
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
  
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" enable xml-reformating
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 2

let g:syntastic_javascript_checkers = ['jshint']

" open Nerdtree when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim when only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" stuff from vim masterclass
:vnoremap . :norm.<CR>
:vnoremap @ :norm@
