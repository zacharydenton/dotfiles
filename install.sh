#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -x

ln -s $DIR/git/.gitconfig ~
ln -s $DIR/tmux/.tmux.conf ~
ln -s $DIR/vim/.vimrc ~
mkdir ~/.vim
ln -s $DIR/vim/pack ~/.vim
ln -s $DIR/zsh/.zshrc ~
ln -s $DIR/zsh/.zshrc.local ~
