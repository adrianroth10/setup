#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

#From: https://linuxconfig.org/how-to-install-docker-on-ubuntu-18-04-bionic-beaver
sudo apt install docker.io

#The following linux commands will start Docker and ensure that starts after the reboot:

sudo systemctl start docker
sudo systemctl enable docker

#usage:
#docker --version

#NOTE: need reboot to work!!!!
