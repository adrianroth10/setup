#!/bin/sh

# Setting exit scripts at error
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

# Functions
function git_clone_or_pull {
	REPOSRC=$1
	LOCALREPO=$2

	LOCALREPO_VC_DIR=$LOCALREPO/.git

	if [ ! -d $LOCALREPO_VC_DIR ]
	then
		git clone $REPOSRC $LOCALREPO
		PULLED=TRUE
	else
		cd $LOCALREPO
		git pull
		#git pull > git_pull_temp
		#if [ "$(head -n 1 git_pull_temp)" != "Already up-to-date." ];
		#then
		#	PULLED=TRUE
		#fi
		#cat git_pull_temp
		#rm git_pull_temp
	fi
}

function package_install {
	sudo apt-get -y install $*
}

function package_uninstall {
	sudo apt-get -y purge $*
}

function package_update {
	sudo apt-get -y update
}

function package_upgrade {
	sudo apt-get -y upgrade
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

function add_line {
	if [ ! -e $1 ]; then
		printf "" > $1
	fi
	while read LINE; do
		if [ "$2" == "$LINE" ]; then
			return
		fi
	done < $1
	printf "$2\n" >> $1
}

