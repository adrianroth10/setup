#!/bin/bash
# Installation of the cuda drivers
# NOT WORKING
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL linux-headers-$(uname -r)
# Might have to update package location
DEB=http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
FILE=$(basename $DEB)
wget $DEB
sudo dpkg -i $FILE
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
$PACKAGE_UPDATE
$PACKAGE_INSTALL cuda
rm $FILE

add_lines ~/.bashrc "# cuda
export PATH=/usr/local/cuda-9.1/bin\${PATH:+:\${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}
"
