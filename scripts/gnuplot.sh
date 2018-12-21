#!/bin/bash
VERSION="gnuplot-5.2.3"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.gnuplot 
fi

if [ "$F" == "f" ] || [ "$F" == "ff" ] ; then

	# For some reason the download procedure does not work :S
	#curl -O https://sourceforge.net/projects/gnuplot/files/latest/download
	#curl -O https://sourceforge.net/projects/gnuplot/files/gnuplot/5.2.3/gnuplot-5.2.3.tar.gz
	#tar -xvf $VERSION.tar.gz ~/.gnuplot

	cd ~/.gnuplot
	./configure
	make 
	make check 
	sudo make install

	#rm -rf $VERSION.tar.gz

fi
