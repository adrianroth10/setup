#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

# Run `bear make` to create a compilation database for your c/c++ project. Semantic autocompletion works!
$PACKAGE_INSTALL cmake
git_clone_or_pull https://github.com/rizsotto/Bear.git ~/.bear
mkdir -p ~/.bear/build
cd ~/.bear/build
cmake ../
sudo make all
sudo make install
sudo make check
sudo make package

#For local install, i.e. no root access, add the following to the bashrc
## path to bear and execution alias
#export PATH="~/.bear/build/bear:$PATH"
#alias bear="bear -l ~/.bear/build/libear/libear.so"

