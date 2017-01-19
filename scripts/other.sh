# List of programs to install with apt-get
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

PROGRAMS=(clamtk \
	  cmake \
	  keepassx \
	  make \
	  silversearcher-ag \
	  unrar \
	  wine)

sudo apt-get install -y ${PROGRAMS[@]}
