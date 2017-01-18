#!/bin/sh

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
