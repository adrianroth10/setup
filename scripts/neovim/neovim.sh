#!/bin/bash
# Will overwrite your current .vimrc file if any exists
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

$PACKAGE_INSTALL neovim xsel
sudo -H pip3 install pynvim
# This action require prior installation of npm
sudo npm install --global neovim

mkdir -p ~/.config/nvim/spell
cp $DIR/init.vim ~/.config/nvim/

#### Plugins ####
# Vim-Plug as package manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qall >/dev/null

# YouCompleteMe (needs to be built)
$PACKAGE_INSTALL build-essential cmake python3-dev dirmngr gnupg apt-transport-https ca-certificates software-properties-common

# install mono-complete
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo apt-add-repository 'deb https://download.mono-project.com/repo/ubuntu stable-focal main'
sudo apt install mono-complete

# install go
wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
add_lines ~/.bashrc "# Go compiler
export PATH=$PATH:/usr/local/go/bin
"
source ~/.bashrc

# compile the plugin
cd ~/.vim/plugged/youcompleteme
python3 install.py --all
