#!/bin/bash

VERSION="v6-08-06"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.root_cern 
fi

#Prerequisites: https://root.cern.ch/build-prerequisites#ubuntu
#Required packages:

#sudo apt-get install git dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev \
#	libxft-dev libxext-dev
#
#Optional packages:
#
#sudo apt-get install gfortran libssl-dev libpcre3-dev \
#	xlibmesa-glu-dev libglew1.5-dev libftgl-dev \
#	libmysqlclient-dev libfftw3-dev libcfitsio-dev \
#	graphviz-dev libavahi-compat-libdnssd-dev \
#	libldap2-dev python-dev libxml2-dev libkrb5-dev \
#	libgsl0-dev libqt4-dev

#https://mark911.wordpress.com/2016/06/02/how-to-compile-and-install-root-data-analysis-framework-from-source-code-via-github-in-ubuntu-14-04-lts-64-bit/

#The last packages are from: https://na58-project-tgeant.web.cern.ch/content/step-step-installation-ubuntu
if [ "$F" == "f" ] || ! command -v opencv_version ; then
	$PACKAGE_INSTALL \
		git \
		dpkg-dev \
		cmake \
		g++ \
		gcc \
		binutils \
		libx11-dev \
		libxpm-dev \
		libxft-dev \
		libxext \
		gfortran libssl-dev libpcre3-dev \
		xlibmesa-glu-dev libglew1.5-dev libftgl-dev \
		libmysqlclient-dev libfftw3-dev libcfitsio-dev \
		graphviz-dev libavahi-compat-libdnssd-dev \
		libldap2-dev python-dev libxml2-dev libkrb5-dev \
		libgsl0-dev libqt4-dev-dev \
		libroot-graf2d-postscript-dev libroot-graf2d-postscript5.34 \
		libroot-graf3d-g3d5.34 libroot-graf3d-g3d-dev libroot-graf3d-eve5.34 libroot-graf3d-eve-dev \
		libroot-math-physics-dev

	if [ -d ~/.root_cern ]; then
		cd ~/.root_cern
		git reset --hard HEAD
	fi
	git_clone_or_pull http://root.cern.ch/git/root.git ~/.root_cern
	#git_clone_or_pull https://github.com/opencv/opencv_contrib.git ~/.opencv_contrib
	cd ~/.root_cern
	#Go to version
	git checkout -b $VERSION $VERSION

	#Follow README for build at fixed location
	mkdir build
	cd build
	cmake ../root -Dgnuinstall=ON -DCMAKE_INSTALL_PREFIX=/usr/local 
	make -j2
	make install
	sudo ldconfig -v

	#echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/opencv.conf
	#sudo ldconfig -v
fi
