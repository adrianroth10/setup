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
		PULLED=TRUE
	else
		cd $LOCALREPO
		git pull > git_pull_temp
		if [ "$(head -n 1 git_pull_temp)" != "Already up-to-date." ];
		then
			PULLED=TRUE
		fi
		rm git_pull_temp
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
	while true; do 
		printf "${CLEAR_LINE}${WHITE}	%-30s %-30s${NO_COLOR}" "$2" $(date -u --date @$((`date +%s` - $1)) +%H:%M:%S)
		sleep 0.5
	done
}
