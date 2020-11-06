#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# shellcheck source=/dev/null
. "$DIR/../../extras/functions.sh"

#https://github.com/textext/textext/wiki/Installation-specific-instructions-for-Linux-systems
#https://textext.github.io/textext/install/linux.html
#NOTE: it needs python2, and therefore use_conda is implemented.
#NOTE from inkscape 1.0 python3 is used so conda can be scapped

sudo add-apt-repository -y ppa:inkscape.dev/stable

$PACKAGE_INSTALL inkscape pstoedit imagemagick pdf2svg gnome-themes-standard libcanberra-gtk-module

mkdir -p ~/.config/inkscape
sudo chown -R "$USER" ~/.config/inkscape

VERSION=1.0.1
RMFILE=TexText-Linux-$VERSION.tar.gz
LOCAL_DIR=textext-$VERSION
wget https://github.com/textext/textext/releases/download/$VERSION/$RMFILE

mkdir -p $LOCAL_DIR && tar -xvf $RMFILE
cd $LOCAL_DIR || exit 1
python3 setup.py
cd ..
rm -rf $LOCAL_DIR $RMFILE

#Install https://github.com/jbohren/beamerscape, but need pull request and this file exists in current dir.
sudo cp "$DIR/.export_overlays.py" /usr/local/bin/export_overlay

# Include template for 16:9 beamer in inkscape
cp "$DIR/.latex_beamer_template.svg" ~/.config/inkscape/templates/Latex\ Beamer\ 16:9.svg
