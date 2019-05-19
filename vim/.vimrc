" General settings
set shiftwidth=2 tabstop=2 expandtab
set nohlsearch
set showtabline=0
set directory=$HOME/.vim/swapfiles//

" Colorscheme
colorscheme dimburn

" FZF
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Grepper
let g:grepper = {}
let g:grepper.tools = ['rg']
set grepprg=rg\ -H\ --no-heading\ --vimgrep
set grepformat=$f:$l:%c:%m

" ALE
let g:ale_fix_on_save = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_linters = {
\ 'javascript': [],
\}
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\}
let g:ale_javascript_prettier_options = '--trailing-comma all --no-bracket-spacing'

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
