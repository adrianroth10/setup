#!/bin/bash
# Python 3 with basic packages
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL \
	curl \
	dvipng \
	python3 \
	python3-pip \
	python3-venv \
	python3-tk \
	python3-pil \
	python3-pil.imagetk \
	python3-pypdf2 \
	ipython \
	cython3 \
	python3-launchpadlib \
	python3-testresources \
	python3-tqdm \

# Weird thing with ubuntu 18 and pip2
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo -H python2.7 get-pip.py
rm get-pip.py

add_lines ~/.pythonrc.py "import numpy as np
import matplotlib.pyplot as plt"
add_lines ~/.bashrc "# python
alias python=python3
export PYTHONSTARTUP=~/.pythonrc.py
"

PACKAGES=( \
	matplotlib \
	numpy \
	scipy \
	scikit-image \
	imageio \
	imutils \
	uncertainties \
	bqplot \
	ipywidgets \
	flake8 \
	pylint \
	cvxpy \
	trimesh \
	)

#-U means upgrade all packages to the newest available version
sudo -H pip3 install -U ${PACKAGES[@]}

# sudo -H jupyter nbextension enable --py --sys-prefix bqplot
# sudo -H jupyter nbextension enable --py widgetsnbextension --sys-prefix

# Installing graph tool
# Will be added multiple times if run again
# sudo_add_lines /etc/apt/sources.list "deb http://downloads.skewed.de/apt/bionic bionic universe
# deb-src http://downloads.skewed.de/apt/bionic bionic universe
# "
# 
# sudo apt-key adv --keyserver pgp.skewed.de --recv-key 612DEFB798507F25
# $PACKAGE_UPDATE
# $PACKAGE_INSTALL python3-graph-tool
