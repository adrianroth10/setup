#!/bin/bash
# Physically Based Rendering
# Adding some useful aliases and exports to .bashrc
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

git clone --recursive https://github.com/mmp/pbrt-v3/ ~/.pbrt
cd ~/.pbrt
cmake .
make -j8
sudo cp pbrt obj2pbrt /usr/local/bin
