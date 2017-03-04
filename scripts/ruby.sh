#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

if [ "$F" == "f" ] || ! command -v rbenv ; then
	git_clone_or_pull https://github.com/rbenv/rbenv.git ~/.rbenv
	git_clone_or_pull https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	$DIR/bashrc.sh
fi
