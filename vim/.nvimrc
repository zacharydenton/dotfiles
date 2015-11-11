filetype off

set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'neovimhaskell/haskell-vim'
"Plugin 'enomsg/vim-haskellConcealPlus'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Twinside/vim-hoogle'
Plugin 'klen/python-mode'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-salve'
Plugin 'elzr/vim-json'
Plugin 'jceb/vim-orgmode'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()
filetype plugin indent on

" General
syntax on
colors zenburn
let mapleader = ","
set incsearch
set nobackup
set nowb
set noswapfile
set mouse=
set nohlsearch
set laststatus=2
set expandtab
set shiftwidth=2
set tabstop=2

" Return to last edit position when opening files
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_args='--ignore=E501'

" Ctrl-P
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
			\ --ignore .git
			\ -g ""'

" Lightline
let g:lightline = {'colorscheme': 'wombat'}

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
  \ ['174', '#93e0e3'],
  \ ['223', '#f0dfaf'],
  \ ['109', '#94bff3'],
  \ ['181', '#dca3a3'],
  \ ['180', '#dfaf8f'],
  \ ['237', '#7cb8bb'],
  \ ['194', '#bfebbf'],
  \ ['109', '#9c6363'],
  \ ['180', '#d0bf8f'],
  \ ['116', '#9fc59f'],
  \ ['109', '#94bff3'],
  \ ['229', '#8c5353'],
  \ ]

" Haskell
let g:haskellmode_completion_ghc = 0
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Python
autocmd FileType python setlocal colorcolumn=120
let g:pymode_rope = 0

" JavaScript
let g:syntastic_javascript_checkers = ['eslint']

" CoffeeScript
autocmd BufNewFile,BufReadPost *.coffee setl sw=2 ts=2 ai sta et fo=croql
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
