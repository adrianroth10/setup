#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

# Cannot be run with setup.sh!!

sudo add-apt-repository ppa:webupd8team/java
$PACKAGE_UPDATE
$PACKAGE_INSTALL oracle-java8-installer

