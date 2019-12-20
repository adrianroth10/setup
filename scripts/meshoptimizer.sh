#!/bin/bash
# Adding some useful aliases and exports to .bashrc
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

NEWDIR=~/.meshoptimizer
git clone -b v0.13 https://github.com/zeux/meshoptimizer.git $NEWDIR
cd $NEWDIR
make config=release gltfpack
sudo ln -s $NEWDIR/gltfpack /usr/local/bin
