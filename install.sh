#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -x

git submodule update --init
mkdir ~/.emacs.d
cp $DIR/emacs/.emacs.d/init.el ~/.emacs.d/init.el
ln -s $DIR/emacs/.emacs.d/config.org ~/.emacs.d/config.org
ln -s $DIR/git/.gitconfig ~
ln -s $DIR/tmux/.tmux.conf ~
ln -s $DIR/vim/.vim ~
mkdir ~/.vim/swapfiles
ln -s $DIR/vim/.vimrc ~
ln -s $DIR/xorg/.xinitrc ~
ln -s $DIR/xorg/.xmodmap ~
ln -s $DIR/zsh/.zshrc ~
ln -s $DIR/zsh/.zshrc.local ~
