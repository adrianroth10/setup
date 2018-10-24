#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

#https://github.com/textext/textext/wiki/Installation-specific-instructions-for-Linux-systems
#NOTE: it needs python2, and therefore use_conda is implemented.

$PACKAGE_UPDATE 
$PACKAGE_INSTALL inkscape pstoedit imagemagick pdf2svg python-gtk2 python-gtksourceview2 gnome-themes-standard

sudo chown -R $USER ~/.config/inkscape

wget https://github.com/textext/textext/releases/download/0.8.1/TexText-Linux-0.8.1.tgz
mkdir -p ~/.textext-0.8.1-linux && tar -xvf TexText-Linux-0.8.1.tgz -C ~/.textext-0.8.1-linux --strip-components=1
cd ~/.textext-0.8.1-linux
sudo python setup.py
rm TexText-Linux-0.8.1.tgz 

#Install https://github.com/jbohren/beamerscape, but need pull request and this file exists in current dir.
sudo cp .export_overlays.py /usr/bin/export_overlays

# Include template for 16:9 beamer in inkscape
cp .latex_beamer_template.svg ~/.config/inkscape/templates/Latex\ Beamer\ 16:9.svg

# A little random to have here, but here goes okular config for annotations
cp .okularpartrc ~/.config/okularpartrc
