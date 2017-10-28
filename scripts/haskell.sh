#!/bin/bash
# Installing the haskell, this means haskell stack, cabal and haste
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "f" ] || ! command -v stack ; then
	wget -qO- https://get.haskellstack.org/ | sh
fi
$PACKAGE_INSTALL cabal-install

if [ "$F" == "f" ] || ! command -v hastec ; then
	cabal update
	cabal install haste-compiler

	add_lines ~/.bashrc "export PATH=\"~/.cabal/bin:\$PATH\""
	source ~/.bashrc
	haste-boot
fi
