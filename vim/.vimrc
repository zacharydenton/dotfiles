" General settings
set shiftwidth=2 tabstop=2 expandtab
set nohlsearch
set showtabline=0
set directory=$HOME/.vim/swapfiles//
set undofile undodir=$HOME/.vim/undo//
for s:dir in [&directory, &undodir]
  if !isdirectory(s:dir) | call mkdir(s:dir, 'p', 0700) | endif
endfor

" Built-in optional packages shipped with Vim 9
if has('patch-9.1.0375') | packadd! comment | endif " gc / gcc to toggle comments
if has('patch-9.0.1799') | packadd! editorconfig | endif
packadd! cfilter " :Cfilter / :Lfilter for quickfix lists

" Colorscheme
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
colorscheme zenburn

" Use ripgrep for :grep (replaces vim-grepper)
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --glob\ '!.git'
  set grepformat=%f:%l:%c:%m
endif
command! -nargs=+ -complete=file_in_path -bar Grep
      \ cgetexpr system(&grepprg . ' ' . <q-args>) | copen | wincmd p

" FZF
if empty($FZF_DEFAULT_COMMAND)
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
endif
command! -bang -nargs=* Find call fzf#vim#grep(
      \ 'rg --column --line-number --no-heading --fixed-strings --ignore-case --color always ' . shellescape(<q-args>),
      \ fzf#vim#with_preview({'options': ['--delimiter', ':', '--nth', '4..']}),
      \ <bang>0)

" ALE
let g:ale_fix_on_save = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_floating_preview = 1
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
set omnifunc=ale#completion#OmniFunc

" Space to copy in visual mode
vnoremap <space> "*y

" Fuzzy finder (FZF) for files
nnoremap <C-P> :Files<CR>

" FZF for a given string across the entire codebase
nnoremap <C-F> :Find<space>

" LSP keybindings
nnoremap <C-J> :ALEGoToDefinition<CR>
nnoremap <S-K> :ALEHover<CR>
nnoremap <F2> :ALEFindReferences<CR>

" Move to next error
nnoremap <C-]> :ALENextWrap<CR>

" Grep for the word under the cursor
nnoremap gd :Grep -w <C-R><C-W><CR>
