#!/bin/bash
# Installing the apache server with php compatability
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

sudo apt-add-repository -y ppa:ondrej/php
$PACKAGE_UPDATE
$PACKAGE_INSTALL apache2 php

sudo /bin/sh -c 'echo "ServerName localhost" >> /etc/apache2/apache2.conf'
sudo service apache2 restart
cd /var/www/
sudo chown -R $(id -un):www-data html
