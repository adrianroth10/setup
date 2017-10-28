#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

#Following: https://www.mendeley.com/download-mendeley-desktop/ubuntu/instructions/

sudo wget https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
sudo dpkg -i mendeleydesktop-latest
sudo rm mendeleydesktop-latest
#mv mendeleydesktop-latest ~/.config/inkscape/extensions/



