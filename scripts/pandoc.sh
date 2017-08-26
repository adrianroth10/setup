#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL pandoc

git_clone_or_pull https://gist.github.com/6714393.git
cd 6714393
mv github-pandoc.css ~/.github-pandoc.css

grep -q -F 'function pandoc_html_css {\n name=${1/.*/.html}\n pandoc --css ~/.github-pandoc.css \$1 -o $name\n }\n' ~/.bashrc || printf 'function pandoc_html_css {\n name=${1/.*/.html}\n pandoc --css ~/.github-pandoc.css $1 -o $name\n }\n' >> ~/.bashrc

rm -rf 6714393
