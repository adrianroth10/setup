#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

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
	tex4ht \
	texlive-lang-greek \
	texlive-lang-german \
