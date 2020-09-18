#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL pandoc

git_clone_or_pull https://gist.github.com/6714393.git
cd 6714393
mv github-pandoc.css ~/.github-pandoc.css

add_lines ~/.bashrc '# pandoc function
function pandoc_html_css { name=${1/.*/.html}; pandoc -H ~/.github-pandoc.css \$1 -o $name }
'

#could add another function based on ruby and inlining.

cd ..
rm -rf 6714393

#OBS: it is necessary to add <style> around the entire file .github-pandoc.css
