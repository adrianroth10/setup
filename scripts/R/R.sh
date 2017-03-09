#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

if [ "$F" == "ff" ]; then
	$PACKAGE_UNINSTALL r-base r-base-dev
fi

if ! command -v R ; then
	sudo add-apt-repository -y ppa:marutter/rrutter
	$PACKAGE_UPDATE
	$PACKAGE_INSTALL r-base r-base-dev
fi

sudo Rscript $DIR/R.R
