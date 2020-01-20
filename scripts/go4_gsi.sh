#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.go4_gsi 
fi

if [ "$F" == "f" ] || [ "$F" == "ff" ] ; then

	curl -O http://web-docs.gsi.de/~go4/download/go4-5.3.2.tar.gz 
	tar -xvf go4-5.3.2.tar.gz 
	mv go4-5.3.2 ~/.go4_gsi
	rm go4-5.3.2.tar.gz 

	cd ~/.go4_gsi
	make all prefix=/usr/local
	sudo make install

	sudo touch /usr/local/share/go4/build/dummy.d

fi
