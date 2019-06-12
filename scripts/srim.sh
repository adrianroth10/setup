#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

## wine needs to already be installed
# sudo apt install wine-stable

# Recipe
# Try the 2008 version, first. Extract the files into the c directory in .wine in program_files and in a directory SRIM-2008. From this directory now execute the setup.exe file and install SRIM to the same path. 
# THIS actually worked, once!
# Following this I followed the lines below to install SRIM-2013 in the ~/.srim directory, and it also worked.

SRIMDIR=~/.srim

mkdir -p $SRIMDIR
curl --output $SRIMDIR/SRIM_INSTALL.exe http://www.srim.org/SRIM/SRIM-2013-Std.e
#curl --output $SRIMDIR/SRIM_INSTALL.exe http://www.srim.org/SRIM/SRIM-2008-Std.e
wine $SRIMDIR/SRIM_INSTALL.exe

if [ "$F" == "ff" ]; then
	rm -rf ~/.pysrim 
fi

# the following clones the pysrim code, it has been necessary due to conda version not functioning.
# With conda activated, i.e. `use_conda`, the setup script is run as `python setup.py install`
if [ "$F" == "f" ] || [ "$F" == "ff" ]; then
	if [ -d ~/.pysrim ]; then
		cd ~/.pysrim
		git gc --prune=now
		git remote prune origin
		#git checkout $VERSION
		git fetch --all
		#git reset --hard origin/$VERSION #this was fatal for some reason
		#git pull https://github.com/Geant4/geant4.git ~/.geant4 $VERSION
		#sudo rm -rf $VERSION-build
		#sudo rm -rf $VERSION-install
	else
		#Download source files
		#wget -O ~/.geant4/ "http://cern.ch/geant4/support/source/geant4.10.03.p01.tar.gz"
		#or clone: 
		git_clone_or_pull https://gitlab.com/costrouc/pysrim.git ~/.pysrim
		cd ~/.pysrim
		#git checkout $VERSION
	fi

	#sudo docker run -v $PWD/examples/docker:/opt/pysrim/ \
	#           -v /tmp/output:/tmp/output \
	#	              -it costrouc/pysrim sh -c "xvfb-run -a python3.6 /opt/pysrim/ni.py"
fi
