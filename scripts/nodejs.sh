#!/bin/bash
# Adding some useful aliases and exports to .bashrc
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL nodejs npm

PACKAGES=( \
    gltf-pipeline \
  )
sudo npm install --global ${PACKAGES[@]}
