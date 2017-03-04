#!/bin/bash
# List of programs to install with apt-get
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

PROGRAMS=(clamtk \
	  cmake \
	  keepassx \
	  make \
	  silversearcher-ag \
	  unrar)

package_install ${PROGRAMS[@]}
