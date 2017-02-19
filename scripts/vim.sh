#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

package_install vim vim-gtk git
git_clone_or_pull https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
PULLED=FALSE

cp $DIR/../.vimrc ~/.vimrc

vim +PluginInstall +qall >/dev/null
