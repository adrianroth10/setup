#!/bin/bash
# Installation of the cuda drivers
# Will probably only work on an ubuntu system with certain GPU:s
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL linux-headers-$(uname -r)
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
$PACKAGE_UPDATE
$PACKAGE_INSTALL cuda
rm cuda-repo-ubuntu1604_9.0.176-1_amd64.deb

add_lines ~/.bashrc "export PATH=/usr/local/cuda-9.0/bin\${PATH:+:\${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}"

