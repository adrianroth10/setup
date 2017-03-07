#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

if [ "$F" == "f" ] || ! command -v rbenv ; then
	git_clone_or_pull https://github.com/rbenv/rbenv.git ~/.rbenv
	git_clone_or_pull https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	$DIR/bashrc.sh
fi

add_lines ~/.bashrc "# rbenv, adding to path and stuff"
add_lines ~/.bashrc "export PATH=\"\$HOME/.rbenv/bin:\$PATH\""
add_lines ~/.bashrc "eval \"\$(rbenv init -)\""
add_lines ~/.bashrc "export PATH=\"\$HOME/.rbenv/plugins/ruby-build/bin:\$PATH\""
