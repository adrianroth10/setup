#!/bin/bash

#Purpose = Installing software on new ubuntumachine

#Created on 2016-08-14

#Author = Adrian Roth

#Version 1.1

#START
# Setting on some music
sudo apt-get install vlc
cvlc --quiet --repeat ~/setup/background_music/* &

sudo apt-get upgrade -y
sudo apt-get update -y


# Installing more complicated programs through scripts
for filename in ~/setup/*;
do
       if [[ ${filename: -3} == ".sh" && ${filename: -8} != "setup.sh" ]]
       then
       	 ${filename}
       fi
done

# Other programs to install and stuff to do
echo Install matlab and slack slack

#Kill the music
pkill -f vlc
