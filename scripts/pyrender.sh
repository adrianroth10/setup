#!/bin/bash
# Installing pyrender
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

sudo -H pip3 install pyrender

sudo apt update
sudo wget https://github.com/mmatl/travis_debs/raw/master/xenial/mesa_18.3.3-0.deb
sudo dpkg -i ./mesa_18.3.3-0.deb || true
sudo apt install -f
rm -f mesa_18.3.3-0.deb

git clone git@github.com:mmatl/pyopengl.git
sudo -H pip3 install ./pyopengl
rm -rf pyopengl
