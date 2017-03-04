#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

package_install \
	latex-beamer \
	texlive-bibtex-extra \
	texlive-fonts-extra \
	texlive-lang-european \
	texlive-latex-base \
	texlive-latex-extra \
	texlive-publishers \
	texlive-publishers-doc \
	texlive-science \
