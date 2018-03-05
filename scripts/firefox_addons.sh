#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

# Following: https://askubuntu.com/questions/492258/installing-a-firefox-extension-via-terminal
# Not working!
EXTENSION=vimium-1.36-fx.xpi
wget https://addons.mozilla.org/firefox/downloads/file/141716/$EXTENSION
firefox-esr $EXTENSION
rm $EXTENSION
