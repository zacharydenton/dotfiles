dotfiles
========

Config for vim, tmux, git, fish, and (on Linux) emacs, X11, awesome, and urxvt.

    git clone --recurse-submodules https://github.com/zacharydenton/dotfiles ~/code/dotfiles
    ~/code/dotfiles/install.sh

`install.sh` is idempotent. It symlinks configs into `$HOME`, installs vim
plugins (git submodules), and on macOS installs dependencies from the
`Brewfile`. It never overwrites files it doesn't own: an existing `~/.gitconfig`
gets an `[include]` of `git/.gitconfig` instead, and anything else that's already
present is reported as `SKIP` for you to merge by hand.

Vim plugins live in `vim/.vim/pack/plugins/start` as submodules (Vim's native
package system). To update them:

    git submodule update --remote
