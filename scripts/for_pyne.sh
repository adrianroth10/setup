#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

conda install -y -c anaconda pip
conda-build jinja2 nose setuptools pytables hdf5 scipy patchelf

sudo $(which pip) --no-cache-dir install \
	numpydoc \ 
	prettytable \
	pyrax \
	xdress \
	cloud_sptheme \
	sphinxcontrib-bibtex
