#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if ! command -v google-chrome ; then
	$PACKAGE_INSTALL libindicator7 libappindicator1 
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome*.deb
	rm google-chrome-stable_current_amd64.deb
fi
