#!/bin/bash
#VERSION="v6-08-06"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.go4_gsi 
fi

if [ "$F" == "f" ] || [ "$F" == "ff" ] ; then
	if [ -d ~/.go4_gsi ]; then
		cd ~/.go4_gsi
		git gc --prune=now
		git remote prune origin

		#git checkout $VERSION
		git fetch --all
		#git reset --hard origin/$VERSION #this was fatal for some reason
		#git pull https://github.com/Geant4/geant4.git ~/.geant4 $VERSION
		git reset --hard HEAD
		#Following line should enable no need to specify the branch to pull
		#git branch --set-upstream=origin/$VERSION $VERSION
		git_clone_or_pull https://github.com/svn2github/Go4.git ~/.go4_gsi
	else 
		git_clone_or_pull https://github.com/svn2github/Go4.git ~/.go4_gsi
		cd ~/.go4_gsi
		#git checkout $VERSION

	fi

	make all prefix=/usr/local
	sudo make install

	#https://github.com/Microsoft/AirSim/issues/751
	sudo ln -s /usr/include/locale.h /usr/include/xlocale.h

	#In file included from libGo4GUI dictionary payload:22:
	#/home/anton/go4-5.3.0/Go4Proxies/TGo4ServerProxy.h:17:10: fatal error: 'TGo4Proxy.h' file not found
	cp Go4ObjectManager/TGo4Proxy.h Go4Proxies/

	#In file included from libGo4AnalBase dictionary payload:47:
	#/home/anton/go4-5.3.0/Go4StatusAnalysis/TGo4AnalysisObjectNames.h:17:10: fatal error: 'TGo4Status.h' file not found
	cp Go4StatusBase/TGo4Status.h Go4StatusAnalysis/

	#In file included from libGo4AnalBase dictionary payload:57:
	#/home/anton/go4-5.3.0/Go4StatusAnalysis/TGo4HistogramStatus.h:17:10: fatal error: 'TGo4ObjectStatus.h' file not found
	cp Go4StatusBase/TGo4ObjectStatus.h Go4StatusAnalysis/

fi
