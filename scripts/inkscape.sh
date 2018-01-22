#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

#Following: http://ubuntuhandbook.org/index.php/2017/01/install-inkscape-0-92-ppa-ubuntu-16-04-16-10-14-04/

sudo add-apt-repository -y ppa:inkscape.dev/stable

$PACKAGE_UPDATE 
$PACKAGE_INSTALL inkscape pstoedit

#Extension for latex texting: "textext"
wget https://pav.iki.fi/_downloads/textext-0.4.4.tar.gz
tar -xvf textext-0.4.4.tar.gz 
mkdir -p ~/.config/inkscape/extensions/
mv -f LICENSE.txt ~/.config/inkscape/extensions/
mv -f textext.inx ~/.config/inkscape/extensions/
mv -f textext.py ~/.config/inkscape/extensions/

rm textext-0.4.4.tar.gz
