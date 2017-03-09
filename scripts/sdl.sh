#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL \
	libsdl2-2.0-0 \
	libsdl-ttf2.0-0 \
	libsdl2-dev \
	libsdl2-ttf-dev
