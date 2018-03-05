#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL \
	python-pip \
	python3-pip \
	python-matplotlib \
	python-numpy \
	python-scipy \
	python2.7 \
	python-dev \
	python-skimage \
	python3-matplotlib \
	python3-numpy \
	python3-scipy \

add_lines ~/.pythonrc.py "import numpy as np
import matplotlib.pyplot as plt"
add_lines ~/.bashrc "# python
export PYTHONSTARTUP=~/.pythonrc.py"

sudo -H pip install --upgrade pip
sudo -H pip install imutils
