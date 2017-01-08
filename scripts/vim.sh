#!/bin/bash
sudo apt-get install -y vim git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp $DIR/../.vimrc ~/.vimrc

vim +PluginInstall +qall
