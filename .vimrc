" Pathogen
call pathogen#infect()

syntax on
filetype plugin indent on
set sw=4 ts=4
let mapleader = ","

" Color scheme
colors zenburn

" Hammer.vim
map <leader>p :Hammer<CR>
let g:HAMMER_BROWSER = "elinks"

" Supertab omnicompletion
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Python
autocmd BufEnter *.py set sw=4 ts=4 sta et fo=croql
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Ruby
autocmd BufEnter *.rb set sw=2 ts=2 sta et fo=croql
nmap <leader>rci :%!ruby-code-indenter<cr> 

" Haskell
autocmd FileType haskell set sw=4 ts=4 sta et fo=croql
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd BufEnter *.hs compiler ghc
let g:haddock_browser = "elinks"

" Go
set rtp+=/usr/local/go/misc/vim

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete 

" Text
autocmd BufNewFile,BufRead *.txt set filetype=pandoc
autocmd FileType pandoc set ai sw=4 ts=4 sta et fo=croql

