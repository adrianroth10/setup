#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

package_install \
	curl \
	libcurl3 \
	libcurl4-gnutls-dev
