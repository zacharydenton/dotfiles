#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/git/.gitconfig ~
ln -s $DIR/tmux/.tmux.conf ~
ln -s $DIR/vim/.vimrc ~
ln -s $DIR/zsh/.zshrc ~
ln -s $DIR/zsh/.zshrc.local ~
