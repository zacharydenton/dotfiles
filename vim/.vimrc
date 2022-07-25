" General settings
set shiftwidth=2 tabstop=2 expandtab
set nohlsearch
set showtabline=0
set directory=$HOME/.vim/swapfiles//

" Colorscheme
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
colorscheme zenburn

" FZF
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Grepper
"runtime plugin/grepper.vim
"let g:grepper.rg.escape .= ''

" ALE
let g:ale_fix_on_save = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_linters = {
\ 'javascript': [],
\ 'rust': ['cargo', 'analyzer'],
\}
let g:ale_fixers = {
\ 'javascript': ['eslint', 'prettier'],
\ 'typescript': ['eslint', 'prettier'],
\ 'typescriptreact': ['eslint', 'prettier'],
\ 'rust': ['rustfmt'],
\ 'ruby': ['rubocop'],
\}

" Space to copy in visual mode
vnoremap <space> "*y

" Fuzzy finder (FZF) for files
map <C-P> :Files<CR>

" FZF for a given string across the entire codebase
map <C-F> :Find<space>

" LSP keybindings
map <C-J> :ALEGoToDefinition<CR>
map <S-K> :ALEHover<CR>
map <F2> :ALEFindReferences<CR>

" Move to next error
map <C-]> :ALENextWrap<CR>

" Grep for the word under the cursor
nnoremap gd :Grepper -cword -noprompt<CR>
