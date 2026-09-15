# Personal fish settings. Symlinked into ~/.config/fish/conf.d/ so it coexists with other snippets
# (e.g. a work-managed config) instead of replacing config.fish.

set -gx EDITOR vim
set -gx VISUAL vim

# Homebrew on Apple Silicon, if it isn't already on PATH (e.g. via /etc/paths.d)
if test -x /opt/homebrew/bin/brew; and not contains /opt/homebrew/bin $PATH
    /opt/homebrew/bin/brew shellenv | source
end

# fzf, powered by ripgrep (matches $FZF_DEFAULT_COMMAND in .vimrc)
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

if status is-interactive
    # Ctrl-T files, Ctrl-R history, Alt-C cd (fzf >= 0.48)
    if command -q fzf
        fzf --fish | source
    end
end
