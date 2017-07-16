#!/bin/bash
# Installing the haskell, this means haskell stack, cabal and haste
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

wget -qO- https://get.haskellstack.org/ | sh
$PACKAGE_INSTALL cabal-install
cabal update
cabal install haste-compiler
