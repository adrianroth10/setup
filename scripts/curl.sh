#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL \
	curl \
	curlftpfs \
	libcurl4 \
	libcurl4-gnutls-dev
