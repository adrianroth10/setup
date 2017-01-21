#!/bin/bash


# Purpose = Installing software on new ubuntumachine

# Created on 2016-08-14

# Author = Adrian Roth

# Version 1.1

# Prepatations
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SETUP=$DIR/setup.log
. $DIR/functions.sh
function error_trap {
	printf "\n${RED}	Error occured!"
	printf "\n	See setup.log\n${NO_COLOR}"
	pkill vlc
}
trap 'error_trap' ERR


# START
echo "" >$SETUP

if ! command -v vlc >/dev/null; then
	printf "${WHITE}Installing VLC\n${NO_COLOR}" 
	package_install vlc >>$SETUP 2>>$SETUP
fi
if ! ps -e | grep vlc > /dev/null; then
	cvlc --quiet -L $DIR/background_music/* &
	printf "${WHITE}Turning on some music\n${NO_COLOR}"
	printf "\n"
fi

printf "${WHITE}apt-get update and upgrade\n${NO_COLOR}"
package_update >>$SETUP 2>>$SETUP
package_upgrade >>$SETUP 2>>$SETUP
printf "${GREEN}update and upgrade done\n${NO_COLOR}"

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
	printf "${CLEAR_LINE}${WHITE}	[$i/$L] Installing $FILE ${NO_COLOR}"
	${SCRIPTS[$i]} >>$SETUP 2>>$SETUP
	printf "${CLEAR_LINE}${GREEN}	$FILE done\n${NO_COLOR}"
done

printf "${CLEAR_LINE}${GREEN}\n	All done${NO_COLOR}\n"
# Kill the music
pkill vlc

# END
