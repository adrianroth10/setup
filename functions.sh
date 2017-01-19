#!/bin/sh

set -e

# Declaring variables
PACKAGE_INSTALLER="sudo apt-get -qq"

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
		git clone $REPOSRC $LOCALREPO >/dev/null
	else
		cd $LOCALREPO
		git reset --hard HEAD >/dev/null
		git pull $REPOSRC >/dev/null
	fi
}
