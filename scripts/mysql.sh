#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

# Will not work in the setup script!!
$PACKAGE_INSTALL mysql-server php-mysql

# Might not work
while true; do
    read -p "Do you wish to add basic user?" yn
    case $yn in
        [Yy]* ) echo "MySql Root user"
		mysql -u root -p -e "CREATE USER '$(id -un)'@'localhost' IDENTIFIED BY ''; GRANT ALL PRIVILEGES ON *.* TO '$(id -un)'@'localhost' WITH GRANT OPTION; FLUSH PRIVILEGES;";;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
