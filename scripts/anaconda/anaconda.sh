#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

#wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
#bash Miniconda3-latest-Linux-x86_64.sh
#rm Miniconda3-latest-Linux-x86_64.sh
#wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
#bash Anaconda3-5.2.0-Linux-x86_64.sh
#rm Anaconda3-5.2.0-Linux-x86_64.sh

#This makes it possible to install more packages to the standard anaconda 
#sudo chown -R $USER ~/anaconda3
sudo chown -R $USER ~/miniconda3

source ~/.bashrc
#source ~/.zshrc

#installing all packages into the base environment from the yaml file. Thus, this is the one to update if needed.
conda env update -f environment.yml

# nbgrader \  # excluded until successful usage demonstrated

# enable python2 in jupyter
#conda create -n ipykernel_py2 python=2 ipykernel
#source activate ipykernel_py2    # On Windows, remove the word 'source'
#python -m ipykernel install --user

# pip packages
pip --no-cache-dir install \
	git+https://github.com/data-8/nbgitpuller \
	plotly \
	pyyaml

# more pip packages
pip --no-cache-dir install \
	jupyter_contrib_nbextensions \
	jupyter_nbextensions_configurator \
	jupyterlab_iframe \
	jupyterlab_latex \
	jupyterlab_github \
	jupyterlab_templates \
	jupyterlab-discovery 


# extensions
#RUN jupyter serverextension enable --sys-prefix --python nbgitpuller

# modern jupyterlab extensions
jupyter labextension install @jupyterlab/google-drive 
jupyter labextension install @jupyterlab/hub-extension
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install jupyterlab_iframe
jupyter serverextension enable --py jupyterlab_iframe
jupyter labextension install @mflevine/jupyterlab_html
jupyter labextension install @jupyterlab/latex
jupyter serverextension enable --sys-prefix jupyterlab_latex
jupyter labextension install @jupyterlab/github
jupyter serverextension enable --sys-prefix jupyterlab_github
jupyter labextension install jupyterlab_templates
jupyter serverextension enable --py jupyterlab_templates
jupyter serverextension enable --sys-prefix jupyterlab_discovery
jupyter labextension install @jupyterlab/plotly-extension
jupyter labextension install jupyterlab-toc
jupyter labextension install jupyterlab_bokeh
jupyter labextension install jupyter-matplotlib


# classical notebook extensions
jupyter nbextension enable --sys-prefix comment-uncomment/main 
jupyter nbextension enable --sys-prefix hide_input/main 
jupyter nbextension enable --sys-prefix splitcell/splitcell
jupyter nbextension enable --sys-prefix tree-filter/index
jupyter nbextension enable --sys-prefix rubberband/main
jupyter nbextension enable --sys-prefix toc2/main
jupyter nbextension enable --sys-prefix export_embedded/main
jupyter nbextension enable --sys-prefix hide_header/main
jupyter nbextensions_configurator enable --user


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

