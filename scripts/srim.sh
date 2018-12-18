#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

#From: https://gitlab.com/costrouc/pysrim

## A script for installing SRIM on Linux machine

## wine needs to already be installed
# sudo apt install wine-stable

SRIMDIR=~/.srim

mkdir -p $SRIMDIR
curl --output $SRIMDIR/SRIM_INSTALL.exe http://www.srim.org/SRIM/SRIM-2013-Std.e
wine $SRIMDIR/SRIM_INSTALL.exe
