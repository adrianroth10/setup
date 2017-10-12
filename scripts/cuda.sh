#!/bin/bash
# Installation of the cuda drivers
# Will probably only work on an ubuntu system
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL linux-headers-$(uname -r)
sudo dpkg --install cuda-repo-<distro>-<version>.<architecture>.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/<distro>/<architecture>/7fa2af80.pub
$PACKAGE_UPDATE
$PACKAGE_INSTALL cuda

add_lines ~/.bashrc "export PATH=/usr/local/cuda-9.0/bin\${PATH:+:\${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}"

sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda
