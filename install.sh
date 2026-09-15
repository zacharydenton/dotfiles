#!/usr/bin/env bash
# Idempotent installer: symlinks configs into $HOME and installs dependencies.
# Safe to re-run. Never overwrites files it doesn't own; it reports them instead.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"

log() { printf '%s\n' "$*"; }

# link SRC DEST -- create DEST -> SRC, replacing only symlinks that already
# point into this repo (e.g. an old checkout path) or are dangling.
link() {
  local src=$1 dest=$2 target
  if [ -L "$dest" ]; then
    target="$(readlink "$dest")"
    if [ "$target" = "$src" ]; then
      log "ok      $dest"
      return
    fi
    if [ ! -e "$dest" ] || [ "${target#"$DIR"/}" != "$target" ]; then
      ln -sfn "$src" "$dest"
      log "relink  $dest -> $src"
      return
    fi
    log "SKIP    $dest (symlink to $target; not managed by this repo)"
    return
  fi
  if [ -e "$dest" ]; then
    log "SKIP    $dest (exists; merge or remove it manually)"
    return
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  log "link    $dest -> $src"
}

log "==> Plugins (git submodules)"
git -C "$DIR" submodule update --init --recursive

if [ "$OS" = Darwin ]; then
  if command -v brew >/dev/null 2>&1; then
    log "==> Homebrew dependencies"
    brew bundle --file="$DIR/Brewfile" --no-upgrade
  else
    log "==> Homebrew not found; install it and re-run to get: $(sed -n 's/^brew "\(.*\)"/\1/p' "$DIR/Brewfile" | tr '\n' ' ')"
  fi
fi

log "==> vim"
link "$DIR/vim/.vim" "$HOME/.vim"
link "$DIR/vim/.vimrc" "$HOME/.vimrc"

log "==> tmux"
link "$DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

log "==> git"
if [ -e "$HOME/.gitconfig" ] && [ ! -L "$HOME/.gitconfig" ]; then
  # A machine-managed ~/.gitconfig already exists (e.g. credential helpers);
  # layer ours on top with an include instead of replacing it.
  if ! git config --global --get-all include.path 2>/dev/null | grep -qxF "$DIR/git/.gitconfig"; then
    git config --global --add include.path "$DIR/git/.gitconfig"
    log "include $HOME/.gitconfig <- $DIR/git/.gitconfig"
  else
    log "ok      $HOME/.gitconfig includes $DIR/git/.gitconfig"
  fi
else
  link "$DIR/git/.gitconfig" "$HOME/.gitconfig"
fi

if command -v fish >/dev/null 2>&1; then
  log "==> fish"
  link "$DIR/fish/.config/fish/conf.d/dotfiles.fish" "$HOME/.config/fish/conf.d/dotfiles.fish"
  link "$DIR/fish/.config/fish/functions/fish_prompt.fish" "$HOME/.config/fish/functions/fish_prompt.fish"
fi

if command -v emacs >/dev/null 2>&1; then
  log "==> emacs"
  link "$DIR/emacs/.emacs.d/init.el" "$HOME/.emacs.d/init.el"
  link "$DIR/emacs/.emacs.d/config.org" "$HOME/.emacs.d/config.org"
fi

if [ "$OS" = Linux ]; then
  log "==> X11"
  link "$DIR/xorg/.xinitrc" "$HOME/.xinitrc"
  link "$DIR/xorg/.xmodmap" "$HOME/.xmodmap"
fi

log "done."
