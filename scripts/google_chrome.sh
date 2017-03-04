#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

if [ "$F" == "ff" ]; then
	package_uninstall google-chrome-stable
fi

if ! command -v google-chrome ; then
	package_install libindicator7 libappindicator1 
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome*.deb
	rm google-chrome-stable_current_amd64.deb
fi
