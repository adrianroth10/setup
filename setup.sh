#!/bin/bash

# Purpose = Installing software on new ubuntumachine

# Created on 2016-08-14

# Author = Adrian Roth

# Version 1.1

# START
sudo apt-get install vlc
printf "\n\nTurning on some music\n\n\n"
cvlc --quiet --repeat ~/setup/background_music/* &

sudo apt-get update -y
sudo apt-get upgrade -y


# Installing programs through scripts
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS=$(find $DIR/scripts -name '*.sh')
for filename in $SCRIPTS;
do
	${filename}
done

sudo apt-get autoremove -y

# Other programs to install and stuff to do
echo Install matlab and slack slack

# Kill the music
pkill vlc
