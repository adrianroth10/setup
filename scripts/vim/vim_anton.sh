#!/bin/bash
# Will overwrite your current .vimrc file if any exists
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

if [ "$F" == "f" ] || [ "$F" == "ff" ] || ! command -v vim ; then
	$PACKAGE_INSTALL vim vim-gtk git
	git_clone_or_pull https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

fi

cp $DIR/vimrc_anton ~/.vimrc
vim +PluginInstall +qall >/dev/null

#Configuring youcompleteme for c-family languages https://stackoverflow.com/questions/16264047/vim-youcompleteme-configuration
#.~/.vim/bundle/youcompleteme/install.py --clang-completer
##for arch linux the above line needs to be:
#python3 install.py --system-libclang --all

#python install.py --clang-completer

#How to get the python enabled? I suspect this is what keeps us from using autocompletion with \ref and \cite in vim-latex.

#://stackoverflow.com/questions/4237817/help-with-configuring-vim-for-c
