#!/bin/bash
# Window manager on linux
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL compiz compizconfig-settings-manager compiz-plugins
