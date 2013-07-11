" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

filetype off
call pathogen#infect()

filetype plugin indent on         " Turn on file type detection.
syntax enable                     " Turn on syntax highlighting.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set encoding=utf-8                " Use UTF-8 everywhere.

set backspace=indent,eol,start    " Intuitive backspacing.
set cursorline                    " highlights the current line

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set relativenumber                " shows the numbers relative at the beginning

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set undofile  " creates a persistent file with undo commands

set gdefault  " substitutions are globally in file

let mapleader = ","  " the , is no the leader key

nnoremap <leader><space> :noh<cr> " clears out the search by taping comma space
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

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

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

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 2

" stuff from vim masterclass
:vnoremap . :norm.<CR>
:vnoremap @ :norm@
