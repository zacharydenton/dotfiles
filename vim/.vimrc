" Plugins
call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-sensible'
Plug 'jnurmine/Zenburn'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'kchmck/vim-coffee-script'
call plug#end()

" General settings
set term=xterm-256color
set t_ut= " disable BCE
set termguicolors
colorscheme zenburn
set shiftwidth=2 tabstop=2 expandtab

" FZF
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --color "always" '.shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ --vimgrep
map <C-P> :Files<CR>
map <C-F> :Find<CR>
