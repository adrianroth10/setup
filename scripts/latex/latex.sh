#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

$PACKAGE_INSTALL \
	texlive-latex-base \
	texlive-latex-extra \
	texlive-bibtex-extra \
	texlive-fonts-extra \
	texlive-lang-european \
	texlive-publishers \
	texlive-science \
	texlive-xetex \
	texlive-extra-utils \
  texlive-plain-generic \
	texlive-lang-greek \
	texlive-lang-german \
  latexmk \

# install latexmk config file
cp $DIR/.latexmkrc ~/

# Where to put 'personal' packages: /usr/share/texmf/tex/latex

# Add neovim plugin
git_clone_or_pull https://github.com/lervag/vimtex.git ~/.local/share/nvim/site/pack/git-plugins/start/vimtex
