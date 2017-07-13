#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

#Following: https://askubuntu.com/questions/812006/how-can-i-mount-my-iphone-6s-on-ubuntu-16-04
#OBS: does not work (Ubuntu 16)

wget -O ~/.iphone_script.sh "https://pastebin.com/dl/6u0TEhjz"
chmod u+x ~/.iphone_setup.sh
ex -bsc '%!awk "{sub(/\r/,\"\")}1"' -cx ~/.iphone_setup.sh
sudo ./~/.iphone_setup.sh
