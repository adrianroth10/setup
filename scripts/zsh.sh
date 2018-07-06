#!/bin/bash
# Adding some useful aliases and exports to .bashrc
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

PACKAGE_INSTALL zsh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
