#!/bin/bash
VERSION="tv"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.tv 
fi

#view spectra, tv
#download linux source and move to ~/.tv
#https://www.ikp.uni-koeln.de/~fitz/

$PACKAGE_INSTALL xutils-dev libxaw7-dev xaw3dg xorg openbox bison

if [ "$F" == "f" ] || [ "$F" == "ff" ] ; then

	#recipe according to 'INSTALL' file in .tv
	# it probably does not work, see comments below if not

	sudo mkdir /usr/local/lib/tv

	cd ~/.tv
	xmkmf -a
	make 
	sudo make install

	#rm -rf $VERSION.tar.gz

fi

#When trying to make in .tv, this error may appear
#Error: GowCutWidget.c:15:10: fatal error: X11/Xaw3d/XawInit.h: No such file or directory
 #include <X11/Xaw3d/XawInit.h>

#Move the package to the tv folder:
#http://deb.debian.org/debian/pool/main/x/xaw3d/xaw3d_1.5+E.orig.tar.gz

# Excerpt from a readme found from the apt-get install of xaw3dg
#   Building Xaw3d without an X11 source tree:
#   ------------------------------------------
#
#   Near the top of this distribution's Imakefile are the lines:
#
#       XCOMM When building outside an X11 source tree:
#       XCOMM EXTRA_INCLUDES = -I.
#
#   Uncomment the second line by deleting the "XCOMM ". Then, while still
#   in /xc/lib/Xaw3d, issue these commands:
#
#       # mkdir X11; cd X11; ln -fs .. Xaw3d; cd ..
#       # xmkmf; make depend; make; make install


#Change from ikp/local/lib/tv/ to usr/local/lib/tv in 
#sudo vim Imake.Config

# add this to .zshrc
#XAPPLRESDIR="/usr/X11R6/lib/X11/app-defaults"; export XAPPLRESDIR

#hack to make compilation run all the way through
#sudo vim /clients/tv/Makefile
#uncomment all lines with MANNEWSUFFIX
