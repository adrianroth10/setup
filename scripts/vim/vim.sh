#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../functions.sh

if [ "$F" == "ff" ]; then
	package_uninstall spotify-client
fi

if [ "$F" == "f" ] || ! command -v vim ; then
	package_install vim vim-gtk git
	git_clone_or_pull https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	cp $DIR/.vimrc ~/.vimrc
fi

vim +PluginInstall +qall >/dev/null
