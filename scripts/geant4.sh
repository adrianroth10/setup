#!/bin/bash

VERSION="geant4-10.3-release"

# Currently has a bug where the sudo password must be written twice
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.geant4 
fi

if [ "$F" == "f" ] || ! command -v opencv_version ; then
	#These are from: https://na58-project-tgeant.web.cern.ch/content/step-step-installation-ubuntu
	$PACKAGE_INSTALL \
		libexpat1-dev \
		libxerces-c-dev \
		qt4-dev-tools \
		libxmu-dev

	#Add source configs to ~/.bashrc
	source ~/.geant/install/$VERSION/bin/geant4.sh
	if [ -d ~/.geant4 ]; then
		cd ~/.geant4
		git reset --hard HEAD
	fi
	git_clone_or_pull https://github.com/opencv/opencv.git ~/.opencv
	git_clone_or_pull https://github.com/opencv/opencv_contrib.git ~/.opencv_contrib
	cd ~/.opencv
	mkdir -p build

	#Download source files
	wget -O ~/.geant4/ "http://cern.ch/geant4/support/source/geant4.10.03.p01.tar.gz"
	#or clone: 
	git_clone_or_pull https://github.com/Geant4/geant4.git ~/.geant4
	git checkout -b $VERSION $VERSION

	#Download data files (not needed since it should be included with build option)
	#wget -O ~/.geant4/ "http://cern.ch/geant4/support/source/G4NDL.4.5.tar.gz"

	#Following: http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/InstallationGuide/html/ch02.html#sect.UnixBuildAndInstall
	cd ~/.geant4
	mkdir g4-build
	cd g4-build
	#Check last dir name
	cmake -DCMAKE_INSTALL_PREFIX=~/usr/local/$(VERSION)-install -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_BUILD_MULTITHREADED=ON -DGEANT4_USE_QT=ON -DGEANT4_USE_GDML=ON -DGEANT4_INSTALL_DATA=ON  -DGEANT4_USE_RAYTRACER_X11=ON ~/.geant4/geant4.10.03??

	make -j2
	make install

	#echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/opencv.conf
	#sudo ldconfig -v
fi
