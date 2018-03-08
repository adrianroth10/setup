#!/bin/bash
# Installing the haskell, this means haskell stack, cabal and haste compiler (v 0.5.5.1)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "f" ] || ! command -v stack ; then
	curl -sSL https://get.haskellstack.org/ | sh -s - -f
fi
$PACKAGE_INSTALL cabal-install
cabal install yaml

if [ "$F" == "f" ] || ! command -v hastec ; then
	WWW=https://www.haste-lang.org/downloads/ghc-7.10/haste-compiler-0.5.5.1_ghc-7.10.3-linux.tar.bz2
	FILE=$(basename $WWW)
	wget $WWW
	tar -xf $FILE
	cd haste-compiler
	sudo ./install.sh
	cd ..
	rm -r $FILE haste-compiler

# 	cabal update
# 	cabal install haste-compiler
# 
# 	add_lines ~/.bashrc "export PATH=\"~/.cabal/bin:\$PATH\""
# 	source ~/.bashrc
# 	haste-boot
fi
