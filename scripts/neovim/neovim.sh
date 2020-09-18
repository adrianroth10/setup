#!/bin/bash
# Will overwrite your current .vimrc file if any exists
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

$PACKAGE_INSTALL neovim xsel
sudo -H pip3 install pynvim
# Require prior installation of npm
sudo npm install --global neovim

mkdir -p ~/.config/nvim/general ~/.config/nvim/keys
cp $DIR/init.vim ~/.config/nvim/
cp $DIR/settings.vim ~/.config/nvim/general/
cp $DIR/mappings.vim ~/.config/nvim/keys/

# Fixing spellchecking in some tex files
# mkdir -p ~/.vim/after/syntax/
# add_lines ~/.vim/after/syntax/tex.vim "syntax spell toplevel"

# Plugins
mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale
