#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

# Following: http://congruityservice.com/blog/keepassx-install-on-ubuntu-16
$PACKAGE_INSTALL libxml2:i386

# Following second answer: https://askubuntu.com/questions/767937/how-do-i-install-adobe-acrobat-in-ubuntu-16-04 

wget ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb

sudo dpkg -i AdbeRdr9.5.5-1_i386linux_enu.deb
rm AdbeRdr9.5.5-1_i386linux_enu.deb

