#!/bin/bash
# Both python 2 and 3 with basic packages
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL \
	dvipng \
	python2.7 \
	python3.5 \
	python-pip \
	python3-pip \
	python3-tk \
	python-dev \
	ipython \
	cython \
	cython3 \

add_lines ~/.pythonrc.py "import numpy as np
import matplotlib.pyplot as plt"
add_lines ~/.bashrc "# python
export PYTHONSTARTUP=~/.pythonrc.py"

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
	)

#-U means upgrade all packages to the newest available version
sudo -H pip install --upgrade pip
sudo -H pip3 install --upgrade pip
sudo -H pip install -U ${PACKAGES[@]}
sudo -H pip3 install -U ${PACKAGES[@]}

sudo -H jupyter nbextension enable --py --sys-prefix bqplot
sudo -H jupyter nbextension enable --py widgetsnbextension --sys-prefix
