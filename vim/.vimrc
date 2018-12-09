" General settings
colorscheme dimburn
set shiftwidth=2 tabstop=2 expandtab

" FZF
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --color "always" '.shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ --vimgrep
map <C-P> :Files<CR>
map <C-F> :Find<CR>
