#!/bin/bash
# Installing the extended support release
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_REMOVE firefox
sudo add-apt-repository -y ppa:jonathonf/firefox-esr
$PACKAGE_UPDATE
$PACKAGE_INSTALL firefox-esr
