#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

sudo add-apt-repository -y ppa:marutter/rrutter
sudo apt-get update -y
sudo apt-get install -y r-base r-base-dev
sudo Rscript R.R
