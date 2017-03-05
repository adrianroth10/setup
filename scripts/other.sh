# List of other programs
#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

PROGRAMS=(clamtk \
	  cmake \
	  keepassx \
	  make \
	  silversearcher-ag \
	  slack-desktop \
	  unrar)

package_install ${PROGRAMS[@]}
