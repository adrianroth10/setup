#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

$PACKAGE_INSTALLER install vim git
git_clone_or_pull https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp $DIR/../.vimrc ~/.vimrc

vim +PluginInstall +qall
