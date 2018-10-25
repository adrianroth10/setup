#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

#Following: http://www.omgubuntu.co.uk/2017/11/android-file-transfer-app-linux

sudo add-apt-repository -y ppa:samoilov-lex/aftl-stable
$PACKAGE_UPDATE
$PACKAGE_INSTALL android-file-transfer
