# List of programs to install with apt-get
PROGRAMS=(clamtk \
	  cmake \
	  keepassx \
	  git \
	  libxss1 \
	  make \
	  silversearcher-ag \
	  unrar \
	  wine)

sudo apt-get install -y ${PROGRAMS[@]}

