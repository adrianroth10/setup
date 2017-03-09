#!/bin/bash


# Purpose = Installing software on new ubuntumachine

# Created on 2016-08-14

# Author = Adrian Roth

# Version 1.1

# Pre
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOG=$DIR/setup.log
. $DIR/extras/functions.sh
function error_trap {
	printf "\n${RED}	Error occured!"
	printf "\n	See setup.log\n${NO_COLOR}"
	kill $PID
	pkill vlc
}
trap 'error_trap' ERR

# START
echo "Log file: `date +%y-%m-%d`" >$LOG
sudo -v

if [ ! -d "${DIR}backround_music" ]; then
	tar -xf ${DIR}/background_music.tar.gz
fi
if ! command -v vlc >/dev/null; then
	printf "${WHITE}Installing VLC\n${NO_COLOR}" 
	$PACKAGE_INSTALL vlc >>$LOG 2>>$LOG
fi
if ! ps -e | grep vlc > /dev/null; then
	printf "${WHITE}Turning on some music\n${NO_COLOR}"
	cvlc --quiet -L $DIR/background_music/* >>$LOG 2>>$LOG & 
fi

printf "${WHITE}apt-get update and upgrade\n${NO_COLOR}"
$PACKAGE_UPDATE >>$LOG 2>>$LOG
$PACKAGE_UPGRADE >>$LOG 2>>$LOG
printf "${GREEN}apt-get update and upgrade done\n${NO_COLOR}"

# If an inputfile is given
if [ $I ]; then
	SCRIPTS=()
	OTHER=()
	while read LINE; do
		if [ ! $LINE ]; then 
			continue
		fi
		NEXTSCRIPT=$(find $DIR/scripts/ -name $LINE)
		if [ "$NEXTSCRIPT" ]; then
			SCRIPTS+=($NEXTSCRIPT)
		else
			OTHER+=($LINE)
		fi
	done < $I
else  # Install everything
	SCRIPTS=$(find $DIR/scripts -name '*.sh')
	SCRIPTS=($SCRIPTS)
fi

START=`date +%s`
L=${#SCRIPTS[@]}
for ((i=0;i<L;i++))
do
	FILE=$(basename ${SCRIPTS[$i]} .sh)
	DATE=`date +%s`
	stopwatch $DATE "[$i/$L] Installing $FILE" &
	PID=$!
	disown

	${SCRIPTS[$i]} -$F >>$LOG 2>>$LOG

	kill $PID
	printf "${CLEAR_LINE}${GREEN}	%-30s %-30s\n${NO_COLOR}" "$FILE done" $(date -u --date @$((`date +%s` - $DATE)) +%H:%M:%S)
done

L=${#OTHER[@]}
if (("$L" > "0")); then
	DATE=`date +%s`
	stopwatch $DATE "Installing Other packages" &
	disown
	PID=$!

	$PACKAGE_INSTALL ${OTHER[@]} >>$LOG 2>>$LOG

	kill $PID
	printf "${CLEAR_LINE}${GREEN}	%-30s %-30s\n${NO_COLOR}" "Other packages done" $(date -u --date @$((`date +%s` - $DATE)) +%H:%M:%S)
fi

printf "${CLEAR_LINE}${GREEN}\n	%-30s %-30s\n${NO_COLOR}" "All done" $(date -u --date @$((`date +%s` - $START)) +%H:%M:%S)

# Kill the music
pkill vlc

# END
