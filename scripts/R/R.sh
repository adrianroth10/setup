#!/bin/bash
sudo add-apt-repository -y ppa:marutter/rrutter
sudo apt-get install -y r-base r-base-dev
sudo apt-get update -y
sudo apt-get upgrade -y
sudo Rscript R.R
