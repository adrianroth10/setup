#!/bin/bash
# Adding some useful aliases and exports to .bashrc
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
$PACKAGE_INSTALL nodejs


PACKAGES=( \
  create-react-app 
  )
sudo npm install --global ${PACKAGES[@]}
