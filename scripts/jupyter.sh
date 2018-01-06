#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

#Not sure about this. Do python2 or 3 or both. 
#In jupyter it seems like python2 and 3 are enabled.

$PACKAGE_INSTALL ipython ipython-notebook

#-U means upgrade all packages to the newest available version

sudo pip install  -U jupyter
sudo pip3 install -U jupyter

sudo pip install  -U numpy
sudo pip3 install -U numpy

sudo pip install  -U scipy
sudo pip3 install -U scipy

sudo pip install  -U matplotlib
sudo pip3 install -U matplotlib

sudo pip install  -U matplotlib
sudo pip3 install -U matplotlib

#Deprecated by jupyter API = nbconvert
#sudo pip install  -U runipy
#sudo pip3 install -U runipy

sudo pip install  -U notedown
sudo pip3 install -U notedown

sudo pip install  -U bqplot
sudo pip3 install -U bqplot
sudo jupyter nbextension enable --py --sys-prefix bqplot

sudo pip install  -U ipywidgets
sudo pip3 install -U ipywidgets
jupyter nbextension enable --py widgetsnbextension --sys-prefix

sudo pip install  -U matplotlib
sudo pip3 install -U matplotlib


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


