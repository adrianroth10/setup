#!/bin/sh

# Setting exit at all errors
set -e

# Declaring variables
RED='\033[0;31m'
GREEN='\e[32m'
YELLOW='\033[0;33m'
WHITE='\e[37m'
NO_COLOR='\033[0m'
CLEAR_LINE='\r\033[K'
BLINK='\e[5m'
NORMAL='\e[25m'

PACKAGE_MANAGER="sudo apt-get"
PACKAGE_INSTALL="$PACKAGE_MANAGER -y install"
PACKAGE_UNINSTALL="$PACKAGE_MANAGER -y purge"
PACKAGE_UPDATE="$PACKAGE_MANAGER -y update"
PACKAGE_UPGRADE="$PACKAGE_MANAGER -y upgrade"


# Functions
function git_clone_or_pull {
	REPOSRC=$1
	LOCALREPO=$2

	LOCALREPO_VC_DIR=$LOCALREPO/.git

	if [ ! -d $LOCALREPO_VC_DIR ]
	then
		git clone $REPOSRC $LOCALREPO
	else
		cd $LOCALREPO
		git pull
	fi
}

function stopwatch {
	while true; do 
		printf "${CLEAR_LINE}${WHITE}	%-30s %-30s${NO_COLOR}" "$2" $(date -u --date @$((`date +%s` - $1)) +%H:%M:%S)
		sleep 0.5
	done
}

function printHelp {
	printf "Usage: $(basename "$0") [-h] [-f[f]] [-i file]
	-- scripts to install and setup programs on your ubuntu machine

where:
	-h show this help text
	-f soft reinstallation of programs
	-ff full reinstallation of program
	-i install subset of programs named in file\n"
}

function getOpts {
	while getopts ":fhi:" opt; do
		case $opt in
			f)
				F=${F}f
				;;
			h)
				printHelp
				exit 0
				;;
			i)
				I=$OPTARG
				;;
			\?)
				printf "Invalid option -${OPTARG}.\n"
				exit 1
				;;
			:)
				printf "Option -$OPTARG requires an argument.\n"
				exit 1
				;;
		esac
	done
}

getOpts $*

# Appends lines to a file if there is no match of the first line
# in input
function add_lines {
	if [ ! -e $1 ]; then
		printf "" > $1
	fi
	FIRSTLINE=${2%%$'\n'*}
	while read LINE; do
		if [ "$FIRSTLINE" == "$LINE" ]; then
			return
		fi
	done < $1
	printf "\n$2" >> $1
}

