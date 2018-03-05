#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.yaml 
fi

git_clone_or_pull https://github.com/jbeder/yaml-cpp.git ~/.yaml_cpp
cd ~/.yaml_cpp

#Follow README for build at fixed location
mkdir -p build
cd build
cmake -DBUILD_SHARED_LIBS=OFF ..
sudo make 
sudo make install

$PACKAGE_INSTALL python-pip python3-pip
sudo -H pip install pyyaml
sudo -H pip3 install pyyaml

#https://pyyaml.org/wiki/PyYAMLDocumentation
