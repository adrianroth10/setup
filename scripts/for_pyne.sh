#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

conda install -y -c pip
conda install -y conda-build jinja2 nose setuptools pytables hdf5 patchelf

sudo $(which pip) --no-cache-dir install \
	numpydoc \ 
	prettytable \
	pyrax \
	xdress \
	cloud_sptheme \
	sphinxcontrib-bibtex
