#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

$PACKAGE_INSTALLER libmysqlclient-dev
# more is needed here!
