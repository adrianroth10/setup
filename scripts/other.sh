#!/bin/bash
# List of other programs
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

PROGRAMS=(clamtk \
	  cmake \
	  keepassx \
	  make \
	  silversearcher-ag \
	  slack-desktop \
	  unrar)

$PACKAGE_INSTALL ${PROGRAMS[@]}
