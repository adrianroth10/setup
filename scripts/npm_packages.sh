#!/bin/bash
# Installing npm packages
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

sudo npm install -g gltf-pipeline
