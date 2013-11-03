" Pathogen
call pathogen#infect()

syntax on
filetype plugin indent on
set sw=4 ts=4
let mapleader = ","
set nocompatible

" Color scheme
colors zenburn

" Powerline
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim


" Hammer.vim
map <leader>p :Hammer<CR>
let g:HAMMER_BROWSER = "w3m"
let g:HAMMER_TEMPLATE = "book"

" CTRL-P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Python
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab shiftround autoindent
let g:jedi#auto_initialization = 0

" Ruby
autocmd BufEnter *.rb set sw=2 ts=2 sta et fo=croql
nmap <leader>rci :%!ruby-code-indenter<cr> 

" Haskell
autocmd FileType haskell set sw=4 ts=4 sta et fo=croql
let g:haddock_browser = "w3m"
let g:haddock_docdir = "~/.cabal/share/doc"

" Go
set rtp+=/usr/local/go/misc/vim

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete 

" Text
autocmd BufNewFile,BufRead *.txt set filetype=pandoc
autocmd BufNewFile,BufRead *.page set filetype=pandoc
autocmd FileType pandoc set ai sw=4 ts=4 et fo=croql

" Coffeescript
autocmd BufNewFile,BufRead *.coffee set sw=2 ts=2 ai sta et fo=croql

autocmd FileType less set sw=2 ts=2
