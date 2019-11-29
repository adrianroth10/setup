#!/bin/bash
# Verbose
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

# Versions tested see below 
# see http://www.python36.com/how-to-install-opencv340-on-ubuntu1604/

VERSION=3.4.0
# VERSION=4.1.0

if [ "$F" == "f" ] || ! command -v opencv_version ; then
	#prerequisites
	$PACKAGE_INSTALL build-essential 
	$PACKAGE_INSTALL cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
	$PACKAGE_INSTALL python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
	$PACKAGE_INSTALL libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
	$PACKAGE_INSTALL libxvidcore-dev libx264-dev
	$PACKAGE_INSTALL libgtk-3-dev
	$PACKAGE_INSTALL libatlas-base-dev gfortran pylint
	$PACKAGE_INSTALL python2.7-dev python3.7-dev

	# Downloading and unziping
	cd ~
	wget https://github.com/opencv/opencv/archive/$VERSION.zip -O opencv-$VERSION.zip
	wget https://github.com/opencv/opencv_contrib/archive/$VERSION.zip -O opencv_contrib-$VERSION.zip

	$PACKAGE_INSTALL unzip
	unzip opencv-$VERSION.zip
	unzip opencv_contrib-$VERSION.zip
	mv opencv-$VERSION .opencv-$VERSION
	mv opencv_contrib-$VERSION .opencv_contrib-$VERSION

	# Making and building
	cd .opencv-$VERSION
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=../../.opencv_contrib-$VERSION/modules -DOPENCV_ENABLE_NONFREE=True ..

	make -j4
	sudo make install
	sudo ldconfig

	rm ~/opencv-$VERSION.zip ~/opencv_contrib-$VERSION.zip
fi
