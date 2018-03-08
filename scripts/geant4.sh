#!/bin/bash
# Currently has a bug where the sudo password must be written twice
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

VERSION="geant4-10.3-release"

if [ "$F" == "ff" ]; then
	rm -rf ~/.geant4 
fi

if [ "$F" == "f" ]; then
	#These are from: https://na58-project-tgeant.web.cern.ch/content/step-step-installation-ubuntu
	$PACKAGE_INSTALL \
		libexpat1-dev \
		libxerces-c-dev \
		qt4-dev-tools \
		libxmu-dev

	if [ -d ~/.geant4 ]; then
		cd ~/.geant4
		git gc --prune=now
		git remote prune origin
		git checkout $VERSION
		git fetch --all
		#git reset --hard origin/$VERSION #this was fatal for some reason
		#git pull https://github.com/Geant4/geant4.git ~/.geant4 $VERSION
		sudo rm -rf $VERSION-build
		sudo rm -rf $VERSION-install
	else
		#Download source files
		#wget -O ~/.geant4/ "http://cern.ch/geant4/support/source/geant4.10.03.p01.tar.gz"
		#or clone: 
		git_clone_or_pull https://github.com/Geant4/geant4.git ~/.geant4
		cd ~/.geant4
		git checkout $VERSION
	fi


	#Download data files (not needed since it should be included with build option)
	#wget -O ~/.geant4/ "http://cern.ch/geant4/support/source/G4NDL.4.5.tar.gz"

	#Following: http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/InstallationGuide/html/ch02.html#sect.UnixBuildAndInstall
	cd ~/.geant4
	mkdir -p $VERSION-build
	mkdir -p $VERSION-install
	#mkdir -p g4-install
	cd $VERSION-build
	#Check last dir name
	sudo cmake -DCMAKE_INSTALL_PREFIX=~/.geant4/$VERSION-install -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_BUILD_MULTITHREADED=ON -DGEANT4_USE_QT=ON -DGEANT4_USE_GDML=ON -DGEANT4_INSTALL_DATA=ON  -DGEANT4_USE_RAYTRACER_X11=ON ../

	sudo make -j2
	sudo make install

	#Add source configs if not existing to ~/.bashrc
	grep -q -F 'source ~/.geant4/$VERSION-install/bin/geant4.sh' ~/.bashrc || echo "source ~/.geant/$VERSION-install/bin/geant4.sh" >> ~/.bashrc
	#Set env variable for modules if not set. OBS: THIS HAS TO BE SET MANUALLY!
	#grep -q -F 'export G4_MODULES=~/.geant4/$VERSION-install/lib/Geant4-10.3.1/Modules' ~/.bashrc || echo "'export G4_MODULES="~/.geant4/$VERSION-install/lib/Geant4-10.3.1/Modules"'" >> ~/.bashrc


	#echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/opencv.conf
	#sudo ldconfig -v
fi
