#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../include/functions.sh

# Will not work in the setup script!!
package_install mysql-server
sudo mysql_install_db
