#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

package_install \
	python-matplotlib \
	python-numpy \
	python-scipy \
	python-unit \
