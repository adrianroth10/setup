#!/bin/bash
# Will overwrite your current .vimrc file if any exists
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

if [ "$F" == "f" ] || ! command -v vim ; then
	$PACKAGE_INSTALL vim vim-gtk git
	git_clone_or_pull https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	cp $DIR/.vimrc ~/.vimrc
fi

vim +PluginInstall +qall >/dev/null
