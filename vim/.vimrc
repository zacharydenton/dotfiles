set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete.vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'scrooloose/syntastic'
Plugin 'dag/vim2hs'
Plugin 'tikhomirov/vim-glsl'
Plugin 'Twinside/vim-hoogle'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'jnurmine/Zenburn'

call vundle#end()
filetype plugin indent on
colorscheme zenburn

" ctrl-p
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ -g ""'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" jedi
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"

" neco-ghc 
let g:necoghc_enable_detailed_browse = 1

" ghcmod
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" hoogle
autocmd BufNewFile,BufRead *.hs map <buffer> <F1> :Hoogle 

" python
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab shiftround autoindent

" haskell
autocmd FileType haskell set tabstop=8 expandtab softtabstop=4 shiftwidth=4 smarttab shiftround nojoinspaces

" text
autocmd BufNewFile,BufRead *.txt set filetype=pandoc
autocmd BufNewFile,BufRead *.page set filetype=pandoc
autocmd FileType pandoc set ai sw=4 ts=4 fo=croql
autocmd FileType pandoc set equalprg = "pandoc -t markdown"

" coffeescript
autocmd BufNewFile,BufReadPost *.coffee setl sw=2 ts=2 ai sta et fo=croql
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" less
autocmd FileType less set sw=2 ts=2
