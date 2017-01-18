#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# including the functions below
. $DIR/../functions.sh

sudo apt-get install -y vim git
git_clone_or_pull https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp $DIR/../.vimrc ~/.vimrc

vim +PluginInstall +qall
