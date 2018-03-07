#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

# Will not work in the setup script!!
$PACKAGE_INSTALL mysql-server php-mysql
