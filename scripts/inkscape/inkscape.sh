#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

#https://github.com/textext/textext/wiki/Installation-specific-instructions-for-Linux-systems
#NOTE: it needs python2, and therefore use_conda is implemented.

$PACKAGE_INSTALL inkscape pstoedit imagemagick pdf2svg python-gtk2 python-gtksourceview2 gnome-themes-standard libcanberra-gtk-module

mkdir -p ~/.config/inkscape
sudo chown -R $USER ~/.config/inkscape

RMFILE=TexText-Linux-0.8.1.tgz
wget https://github.com/textext/textext/releases/download/0.8.1/$RMFILE
mkdir -p ~/.textext-0.8.1-linux && tar -xvf $RMFILE -C ~/.textext-0.8.1-linux --strip-components=1
rm $RMFILE
cd ~/.textext-0.8.1-linux
sudo python setup.py

#Install https://github.com/jbohren/beamerscape, but need pull request and this file exists in current dir.
sudo cp $DIR/.export_overlays.py /usr/local/bin/export_overlay

# Include template for 16:9 beamer in inkscape
# cp .latex_beamer_template.svg ~/.config/inkscape/templates/Latex\ Beamer\ 16:9.svg
