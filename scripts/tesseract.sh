#!/bin/bash
# Python 3 with basic packages
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL tesseract-ocr
sudo -H pip3 install pillow pytesseract
