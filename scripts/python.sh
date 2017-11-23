#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL \
	python-matplotlib \
	python-numpy \
	python-scipy \
	python2.7 \
	python-dev \
	python-pip \
	python3-pip \
	python-skimage \
