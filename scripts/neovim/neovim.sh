#!/bin/bash
# Will overwrite your current .vimrc file if any exists
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

$PACKAGE_INSTALL neovim xsel
sudo -H pip3 install pynvim
# Require prior installation of npm
sudo npm install --global neovim

mkdir -p ~/.config/nvim/spell
cp $DIR/init.vim ~/.config/nvim/

#### Plugins ####
# Ale for linting
mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale
