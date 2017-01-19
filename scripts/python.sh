#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

sudo apt-get install -y \
	python-matplotlib \
	python-numpy \
	python-scipy \
	python-unit \
