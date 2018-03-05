#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
bash Anaconda3-5.0.1-Linux-x86_64.sh
rm Anaconda3-5.0.1-Linux-x86_64.sh

source ~/.bashrc

# setting up jupyter-lab
#conda install -y -c conda-forge jupyterlab

# Packages for extensions and ...
conda -c conda-forge install nodejs
conda -c conda-forge install uncertainties

#This makes it possible to install more packages to the standard anaconda 
sudo chown -R $USER anaconda3

# adding vim key binding for the notebook
# Create required directory in case (optional)
#mkdir -p $(jupyter --data-dir)/nbextensions
## Clone the repository
#cd $(jupyter --data-dir)/nbextensions
#git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
## Activate the extension
#jupyter nbextension enable vim_binding/vim_binding
#
#conda install root-numpy
#conda install rootpy #Not yet supported

#Environment for ROOTPY
#conda create --name=ROOTENV python=3.4 ipykernel

#This application failed to start because it could not find or load the Qt platform plugin "xcb"in "".
# see https://stackoverflow.com/questions/33051790/anaconda-python-could-not-find-or-load-the-qt-platform-plugin-xcb

