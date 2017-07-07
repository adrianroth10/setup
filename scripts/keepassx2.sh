#!/bin/bash
# Following: http://ubuntuhandbook.org/index.php/2015/12/install-keepassx-2-0-in-ubuntu-16-04-15-10-14-04/
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

sudo add-apt-repository ppa:hda-me/keepassx2-yubico
$PACKAGE_UPDATE
$PACKAGE_INSTALL keepassx
