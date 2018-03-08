#!/bin/bash
# Will overwrite your current .vimrc file if any exists
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

if [ "$F" == "f" ] || [ "$F" == "ff" ] || ! command -v vim ; then
	$PACKAGE_INSTALL vim vim-gtk git
	git_clone_or_pull https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

fi

cp $DIR/.vimrc ~/.vimrc
vim +PluginInstall +qall >/dev/null

# Fixing spellchecking in some tex files
mkdir -p ~/.vim/after/syntax/
add_lines ~/.vim/after/syntax/tex.vim "syntax spell toplevel"
