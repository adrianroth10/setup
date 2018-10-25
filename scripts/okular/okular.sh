#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

$PACKAGE_INSTALL okular
cp .okularpartrc ~/.config/okularpartrc
