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
CURSOR_UP='\033[1A'
BLINK='\e[5m'
NORMAL='\e[25m'

PACKAGE_MANAGER="sudo apt-get"
PACKAGE_INSTALL="$PACKAGE_MANAGER -y install"
PACKAGE_REMOVE="$PACKAGE_MANAGER -y remove"
PACKAGE_UPDATE="$PACKAGE_MANAGER -y update"
PACKAGE_UPGRADE="$PACKAGE_MANAGER -y upgrade"


# Functions
function git_clone_or_pull {
	REPOSRC=$1
	LOCALREPO=$2
	BRANCH=$3

	LOCALREPO_VC_DIR=$LOCALREPO/.git

	if [ ! -d $LOCALREPO_VC_DIR ]
	then
		git clone $REPOSRC $LOCALREPO || return $?
	elif [ -z "$3" ]; then
		cd $LOCALREPO
		git pull || return $?
	else 
		git pull origin $BRANCH
	fi
}

function stopwatch {
	while true; do 
		printf "${CURSOR_UP}${CLEAR_LINE}${WHITE}	%-30s %-30s${NO_COLOR}\n" "$2" $(date -u --date @$((`date +%s` - $1)) +%H:%M:%S)
		sleep 0.5
	done
}

function printHelp {
	printf "Usage:	$(basename "$0") [-h] [-m] [-f[f]] [-i file]
	$(basename "$0") file
	-- scripts to install and setup programs on your ubuntu machine

where:
	-h show this help text
	-m install with music (only in setup.sh)
	-f soft reinstallation of programs
	-ff full reinstallation of program
	-i install subset of programs named in file
	file input file as above if just one argument\n"
}

function getOpts {
	while getopts ":fmhi:" opt; do
		case $opt in
			f)
				F=${F}f
				;;
			h)
				printHelp
				exit 0
				;;
			m)
				M=m
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
	if [ ! $F ] && [ $# == "1" ]; then
		I="$1"
	fi
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

