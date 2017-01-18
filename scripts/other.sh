# List of programs to install with apt-get
PROGRAMS=(clamtk \
	  cmake \
	  keepassx \
	  make \
	  silversearcher-ag \
	  unrar \
	  wine)

sudo apt-get install -y ${PROGRAMS[@]}

