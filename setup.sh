#!/bin/bash


# Purpose = Installing software on new ubuntumachine

# Created on 2016-08-14

# Author = Adrian Roth

# Version 1.1

# Prepatations
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOG=$DIR/setup.log
. $DIR/functions.sh
function error_trap {
	printf "\n${RED}	Error occured!"
	printf "\n	See setup.log\n${NO_COLOR}"
	pkill vlc
}
trap 'error_trap' ERR


# START
echo "" >$LOG

if ! command -v vlc >/dev/null; then
	printf "${WHITE}Installing VLC\n${NO_COLOR}" 
	package_install vlc >>$LOG 2>>$LOG
fi
if ! ps -e | grep vlc > /dev/null; then
	cvlc --quiet -L $DIR/background_music/* >>$LOG 2>>$LOG & 
	printf "${WHITE}Turning on some music\n${NO_COLOR}"
fi

printf "${WHITE}apt-get update and upgrade\n${NO_COLOR}"
package_update >>$LOG 2>>$LOG
package_upgrade >>$LOG 2>>$LOG
printf "${GREEN}apt-get update and upgrade done\n${NO_COLOR}"

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
	stopwatch "${CLEAR_LINE}${WHITE}	[$i/$L] Installing $FILE ${NO_COLOR} " &
	PID=$!
	disown
	${SCRIPTS[$i]} >>$LOG 2>>$LOG
	kill $PID
	printf "${CLEAR_LINE}${GREEN}	$FILE done\n${NO_COLOR}"
done

printf "${CLEAR_LINE}${GREEN}\n	All done${NO_COLOR}\n"
# Kill the music
pkill vlc

# END
