#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.yaml_cpp
fi

git_clone_or_pull https://github.com/jbeder/yaml-cpp.git ~/.yaml_cpp
cd ~/.yaml_cpp

#Follow README for build at fixed location
mkdir -p build
cd build
cmake -DBUILD_SHARED_LIBS=ON ..
sudo make 
sudo make install
