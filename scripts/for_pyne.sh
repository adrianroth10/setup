#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

conda install -y -c anaconda pip

sudo $(which pip) --no-cache-dir install \
	pyrax \
	xdress
