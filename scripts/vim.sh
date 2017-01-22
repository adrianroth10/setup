#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

package_install vim git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp $DIR/../.vimrc ~/.vimrc

vim +PluginInstall +qall >/dev/null
