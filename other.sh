# List of programs to install with apt-get
PROGRAMS=(clamtk \
	  cmake \
	  keepassx \
	  git \
	  libappindicator1 \
	  libindicator7 \
	  libxss1 \
	  silversearcher-ag \
	  unrar \
	  wine)

sudo apt-get install -y ${PROGRAMS[@]}

