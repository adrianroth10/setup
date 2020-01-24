#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

#https://github.com/textext/textext/wiki/Installation-specific-instructions-for-Linux-systems
#https://textext.github.io/textext/install/linux.html
#NOTE: it needs python2, and therefore use_conda is implemented.

$PACKAGE_INSTALL inkscape pstoedit imagemagick pdf2svg python-gtk2 python-gtksourceview2 gnome-themes-standard libcanberra-gtk-module

mkdir -p ~/.config/inkscape
sudo chown -R $USER ~/.config/inkscape

VERSION=0.11.0
RMFILE=TexText-Linux-$VERSION.tar.gz
LOCAL_DIR=textext-$VERSION
wget https://github.com/textext/textext/releases/download/$VERSION/$RMFILE

mkdir -p $LOCAL_DIR && tar -xvf $RMFILE
cd $LOCAL_DIR
sudo -H python setup.py
cd ..
rm -rf $LOCAL_DIR $RMFILE

#Install https://github.com/jbohren/beamerscape, but need pull request and this file exists in current dir.
sudo cp $DIR/.export_overlays.py /usr/local/bin/export_overlay

# Include template for 16:9 beamer in inkscape
cp $DIR/.latex_beamer_template.svg ~/.config/inkscape/templates/Latex\ Beamer\ 16:9.svg
