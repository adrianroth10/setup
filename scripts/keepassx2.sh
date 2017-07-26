#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

# Following: http://ubuntuhandbook.org/index.php/2015/12/install-keepassx-2-0-in-ubuntu-16-04-15-10-14-04/
#sudo add-apt-repository -y ppa:hda-me/keepassx2-yubico

# Following: http://congruityservice.com/blog/keepassx-install-on-ubuntu-16
$PACKAGE_INSTALL qt-sdk qtcreator libgcrypt11-dev zlib1g-dev cmake
wget https://www.keepassx.org/releases/2.0.2/keepassx-2.0.2.tar.gz
tar -xvf keepassx-2.0.2.tar.gz 
cd keepassx-2.0.2/
mkdir -p build
cd build
sudo cmake ../
sudo make install
cd ../../
rm keepassx-2.0.2.tar.gz
rm -rf keepassx-2.0.2
