#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL \
	python2.7 \
	python3.5 \
	python-pip \
	python3-pip \
	python-dev \

add_lines ~/.pythonrc.py "import numpy as np
import matplotlib.pyplot as plt"
add_lines ~/.bashrc "# python
export PYTHONSTARTUP=~/.pythonrc.py"

sudo -H pip install --upgrade pip

PACKAGES=( matplotlib \
	numpy \
	scipy \
	scikit-image \
	matplotlib \
	numpy \
	scipy \
	imutils \
	pyyaml \
	uncertainties \
	)

sudo -H pip install -U ${PACKAGES[@]}
sudo -H pip3 install -U ${PACKAGES[@]}
