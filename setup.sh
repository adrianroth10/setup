#!/bin/bash

# Purpose = Installing software on new ubuntumachine

# Created on 2016-08-14

# Author = Adrian Roth

# Version 1.1

# START
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/functions.sh

printf "${WHITE}Installing VLC\n${NO_COLOR}" 
$PACKAGE_INSTALLER install vlc
cvlc --quiet ~/setup/background_music/* &
printf "${WHITE}Turning on some music${NO_COLOR}"

printf "${WHITE}apt-get update and upgrade${NO_COLOR}"
$PACKAGE_INSTALLER update
$PACKAGE_INSTALLER upgrade

# If an inputfile is given
if [ "$#" -eq 1 ]; then
	SCRIPTS=()
	while read LINE; do
		SCRIPTS+=($(find $DIR/scripts/ -name $LINE))
	done < $1
else  # Install everything
	SCRIPTS=$(find $DIR/scripts -name '*.sh')
	SCRIPTS=($SCRIPTS)
fi

L=${#SCRIPTS[@]}
L=$((L-1))
for i in $(seq 1 $L);
do
	FILE=$(basename ${SCRIPTS[$i]} .sh)
	printf "${CLEAR_LINE}${WHITE}	[$i/$L] Installing $FILE${NO_COLOR}"
	${SCRIPTS[$i]}
	printf "${CLEAR_LINE}${GREEN}	$FILE done\n${NO_COLOR}"
done

printf "${WHITE}apt-get autoremove${NO_COLOR}"
$PACKAGE_INSTALLER autoremove

printf "${CLEAR_LINE}${GREEN}\n	All done${NO_COLOR}\n"
# Kill the music
pkill vlc

# END
