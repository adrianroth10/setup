#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../include/functions.sh

if [ "$F" == "ff" ]; then
	package_uninstall r-base r-base-dev
fi

if ! command -v R ; then
	sudo add-apt-repository -y ppa:marutter/rrutter
	package_update
	package_install r-base r-base-dev
fi

sudo Rscript $DIR/R.R
