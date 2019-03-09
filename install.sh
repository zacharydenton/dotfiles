#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -x

git submodule update --init
ln -s $DIR/emacs/.doom.d ~
ln -s $DIR/emacs/.emacs.d ~
ln -s $DIR/git/.gitconfig ~
ln -s $DIR/tmux/.tmux.conf ~
ln -s $DIR/vim/.vim ~
mkdir ~/.vim/swapfiles
ln -s $DIR/vim/.vimrc ~
ln -s $DIR/zsh/.zshrc ~
ln -s $DIR/zsh/.zshrc.local ~
