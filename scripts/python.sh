#!/bin/bash
# Python 3 with basic packages
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL \
	python3.5 \
	python3-pip \
	python3-tk \
	ipython \
	cython3 \
	python3-launchpadlib \
	python3-testresources \

add_lines ~/.pythonrc.py "import numpy as np
import matplotlib.pyplot as plt"
add_lines ~/.bashrc "# python
alias python=python3
export PYTHONSTARTUP=~/.pythonrc.py
"

PACKAGES=( matplotlib \
	numpy \
	scipy \
	scikit-image \
	matplotlib \
	numpy \
	scipy \
	imageio \
	imutils \
	pyyaml \
	uncertainties \
	jupyter \
	notedown \
	bqplot \
	ipywidgets \
	flake8 \
	)

#-U means upgrade all packages to the newest available version
sudo -H pip3 install --upgrade pip
sudo -H pip3 install -U ${PACKAGES[@]}

sudo -H jupyter nbextension enable --py --sys-prefix bqplot
sudo -H jupyter nbextension enable --py widgetsnbextension --sys-prefix
