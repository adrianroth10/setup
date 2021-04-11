#!/bin/bash
# Will overwrite your current .vimrc file if any exists
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# shellcheck source=/dev/null
. "$DIR/../../extras/functions.sh"

# install minicode before this script if you want it
# This action require prior installation of npm
$PACKAGE_INSTALL neovim xsel
pip install pynvim
sudo npm install --global neovim

mkdir -p ~/.config/nvim/spell
cp "$DIR/init.vim" ~/.config/nvim/

#### Plugins ####
# Vim-Plug as package manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qall >/dev/null

# Installing Linters for ale
$PACKAGE_INSTALL shellcheck
$PACKAGE_INSTALL lacheck
pip install pylint

### Building YouCompleteMe ####
$PACKAGE_INSTALL build-essential cmake python3-dev dirmngr gnupg apt-transport-https ca-certificates software-properties-common default-jre

# install mono-complete
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo apt-add-repository 'deb https://download.mono-project.com/repo/ubuntu stable-focal main'
$PACKAGE_INSTALL mono-complete

# install go
wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
add_lines ~/.bashrc "# Go compiler
export PATH=/usr/local/go/bin:\$PATH
"

# shellcheck source=/dev/null
. ~/.bashrc

# compile the plugin
cd ~/.vim/plugged/youcompleteme || exit 1
python3 install.py --all
###
# tern problem (see https://github.com/ain/.vim/issues/46#issuecomment-704151014)
rm -rf third_party/ycmd/third_party/tern_runtime/node_modules
