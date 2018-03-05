#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

VERSION="master"

#git clone https://github.com/pyne/install_scripts.git temp

cd temp
sudo ./ubuntu_16.04.sh

#if [ -d ~/.pyne ]; then
#	cd ~/.pyne
#	git gc --prune=now
#	git remote prune origin
#
#	git checkout $VERSION
#	git fetch --all
#	#git reset --hard origin/$VERSION #this was fatal for some reason
#	#git pull https://github.com/Geant4/geant4.git ~/.geant4 $VERSION
#	git reset --hard HEAD
#	#Following line should enable no need to specify the branch to pull
#	#git branch --set-upstream=origin/$VERSION $VERSION
#	git_clone_or_pull https://github.com/pyne/pyne.git ~/.pyne $VERSION
#else 
#	git_clone_or_pull https://github.com/pyne/pyne.git ~/.pyne $VERSION
#	cd ~/.pyne
#	git checkout $VERSION
#
#fi
#
#
#
#python setup.py install --user
#scripts/nuc_data_make

cd ../

rm -rf temp

pip install --upgrade uncertainties
pip3 install --upgrade uncertainties
