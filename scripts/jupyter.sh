#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

#Not sure about this. Do python2 or 3 or both. 
#In jupyter it seems like python2 and 3 are enabled.

$PACKAGE_INSTALL python-pip python3-pip ipython ipython-notebook

#-U means upgrade all packages to the newest available version

sudo -H pip install  -U jupyter
sudo -H pip3 install -U jupyter

#Deprecated by jupyter API = nbconvert
#sudo pip install  -U runipy
#sudo pip3 install -U runipy

sudo -H pip install  -U notedown
sudo -H pip3 install -U notedown

sudo -H pip install  -U bqplot
sudo -H pip3 install -U bqplot
sudo -H jupyter nbextension enable --py --sys-prefix bqplot

sudo -H pip install  -U ipywidgets
sudo -H pip3 install -U ipywidgets
sudo -H jupyter nbextension enable --py widgetsnbextension --sys-prefix

#sudo pip install -U  plotly
#sudo pip3 install -U plotly

#For C++: http://shuvomoy.github.io/blog/programming/2016/08/04/Cpp-kernel-for-Jupyter.html
#wget https://root.cern.ch/download/cling/cling_2017-08-05_ubuntu16.tar.bz2
#tar -xvf cling_2017-08-05_ubuntu16.tar.bz2
#grep -q -F 'export PATH=~/cling_ubuntu/bin:$PATH' ~/.bashrc || echo "export PATH=~/cling_ubuntu/bin:$PATH" >> ~/.bashrc
#grep -q -F 'source ~/cling_ubuntu/share/cling/Jupyter/kernel' ~/.bashrc || echo "source ~/cling_ubuntu/share/cling/Jupyter/kernel" >> ~/.bashrc
#cd /cling-install-prefix/share/cling/Jupyter/kernel
#pip install -e .
#jupyter-kernelspec install cling-cpp11


#rm cling_2017-08-05_ubuntu16.tar.bz2
#rm -rf cling_2017-08-05_ubuntu16


