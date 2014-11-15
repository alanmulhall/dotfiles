" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf-8

" make molokai look more like gui version
let g:rehash256 = 1

" Pathogen
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

" set color column
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" don't allow backspacing over everything in insert mode
set backspace=

set nobackup
set nowritebackup
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

"change exit from insert mode
inoremap jk <ESC>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" <comma> is the lead
let mapleader = ","

" Toggle paste
set pastetoggle=<leader>V

" Split window
map <Leader>w :vsplit <CR>

" quit
map <Leader>q :q <CR>

"navigation panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Maps autocomplete to tab
imap <leader><Tab> <C-P>

" Display extra whitespace
set list
set listchars=tab:»·,trail:·

" Use Ack instead of Grep when available
"if executable("ack")
"  set grepprg=ack\ -H\ --nogroup\ --nocolor
"endif

" Numbers
set number
set numberwidth=5

" Color scheme
"colorscheme jellybeans
colorscheme molokai
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Window navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>

" Warn me to use the letters not the arrows for navigating
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Show NERDTree
map <Leader>n :NERDTree <CR>

"rebind my favorite commands from Git.vim for Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gb :Gblame<cr>

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby


" Syntastic

" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Searching                                                                                                                                   │ 130 nmap <leader><leader> /<c-r>=expand("<cword>")<cr><cr>N
nmap <leader><leader> /<c-r>=expand("<cword>")<cr><cr>N                                                                                       │ 131 nmap <leader>f :Ack <c-r>=expand("<cword>")<cr>
nmap <leader>f :Ack <c-r>=expand("<cword>")<cr>                                                                                               │ 132 nmap <leader>d :Ack "def (self\.)?<c-r>=expand("<cword>"
nmap <leader>d :Ack "def (self\.)?<c-r>=expand("<cword>")<cr>"                                                                                │     )<cr>"
                                                                                                                                              │ 133
function! ReplaceIt()                                                                                                                         │ 134 function! ReplaceIt()
  call inputsave()                                                                                                                            │ 135   call inputsave()
  let replacement = input('Enter replacement:')                                                                                               │ 136   let replacement = input('Enter replacement:')
  call inputrestore()                                                                                                                         │ 137   call inputrestore()
  execute '%s/'.expand('<cword>').'/'.replacement.'/g'                                                                                        │ 138   execute '%s/'.expand('<cword>').'/'.replacement.'/g'
endfunction                                                                                                                                   │ 139 endfunction
                                                                                                                                              │ 140
nmap <leader>s :call ReplaceIt()<cr>
