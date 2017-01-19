#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

cp $DIR/../.bashrc ~/.bashrc
