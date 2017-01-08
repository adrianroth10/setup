#!/bin/bash
sudo apt-get install -y libindicator7 libappindicator1 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
rm google-chrome-stable_current_amd64.deb
