#!/bin/bash
#echo "deb http://cran.rstudio.com/bin/linux/ubuntu precise/" | sudo tee -a /etc/apt/sources.list
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
#sudo add-apt-repository -y ppa:marutter/rdev
sudo add-apt-repository -y ppa:marutter/rrutter
sudo apt-get install -y r-base r-base-dev #libssl-dev libssl1.0.0 
sudo apt-get update
sudo apt-get upgrade
sudo Rscript R.R



