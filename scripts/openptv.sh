#!/bin/bash
# Verbose
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL cmake check

OUTPUT_DIR=~/.openptv
git clone https://github.com/OpenPTV/openptv.git ~/.openptv
cd $OUTPUT_DIR/liboptv

cmake .
make
# make verify  # not working
sudo make install

pip install pyptv --index-url https://pypi.fury.io/pyptv --extra-index-url https://pypi.org/simple
