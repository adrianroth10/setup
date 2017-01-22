#!/bin/sh

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
	else
		cd $LOCALREPO
		git reset --hard HEAD
		git pull $REPOSRC
	fi
}

function package_install {
	sudo apt-get -y install $*
}

function package_update {
	sudo apt-get -y update
}

function package_upgrade {
	sudo apt-get -y upgrade
} 

function stopwatch {
	date1=`date +%s`; 
	while true; do 
		printf "${CLEAR_LINE}$1$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)"; 
		sleep 1;
	done
}
