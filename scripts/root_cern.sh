#!/bin/bash

#VERSION="v6-04-18"
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
#Commented cannot be installed for some reason.
if [ "$F" == "f" ]; then
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
		libssl-dev \
		libpcre3-dev \
		xlibmesa-glu-dev \
		libglew1.5-dev \
		libftgl-dev \
		libmysqlclient-dev \
		graphviz-dev \
		libavahi-compat-libdnssd-dev \
		libldap2-dev \
		python-dev \
		libxml2-dev \
		libkrb5-dev \
		libgsl0-dev \
		libroot-graf2d-postscript-dev \
		libroot-graf2d-postscript5.34 \
		libroot-graf3d-g3d5.34 \
		libroot-graf3d-g3d-dev \
		libroot-graf3d-eve5.34 \
		libroot-graf3d-eve-dev \
		libroot-math-physics-dev
		#gfortran \
		#libfftw3-dev \ 
		#libcfitsio-dev \
		#libqt4-dev-dev \
		#libxext \

	if [ -d ~/.root_cern ]; then
		cd ~/.root_cern
		git gc --prune=now
		git remote prune origin

		git checkout $VERSION
		git fetch --all
		#git reset --hard origin/$VERSION #this was fatal for some reason
		#git pull https://github.com/Geant4/geant4.git ~/.geant4 $VERSION
		sudo rm -rf root-build
		sudo rm -rf root-install
		git reset --hard HEAD
		#Following line should enable no need to specify the branch to pull
		#git branch --set-upstream=origin/$VERSION $VERSION
		git_clone_or_pull http://root.cern.ch/git/root.git ~/.root_cern $VERSION
	else 
		git_clone_or_pull http://root.cern.ch/git/root.git ~/.root_cern
		cd ~/.root_cern
		git checkout $VERSION

	fi

	#Follow README for build at fixed location
	mkdir -p root-build
	mkdir -p root-install
	cd root-build
	sudo cmake ../ -Dgnuinstall=ON -Dpython2=ON -Dpython3=ON -DCMAKE_INSTALL_PREFIX=~/.root_cern/root-install 
	sudo make -j2
	sudo make install
	sudo ldconfig -v

	#If not existing, adding line to file
	grep -q -F 'source ~/.root_cern/root-install/bin/thisroot.sh' ~/.bashrc || echo "source ~/.root_cern/root-install/bin/thisroot.sh" >> ~/.bashrc

fi
