#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

package_install \
	latex-beamer \
	texlive-bibtex-extra \
	texlive-fonts-recommended \
	texlive-lang-swedish \
	texlive-latex-base \
	texlive-latex-extra \
	texlive-publishers \
	texlive-publishers-doc \
	texlive-science \
