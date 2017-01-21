#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../functions.sh

if ! command -v R > /dev/null; then
	sudo add-apt-repository -y ppa:marutter/rrutter
	package_update
fi

package_install r-base r-base-dev
sudo Rscript $DIR/R.R
