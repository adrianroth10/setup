#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "f" ] || ! command -v rbenv ; then
	git_clone_or_pull https://github.com/rbenv/rbenv.git ~/.rbenv
	git_clone_or_pull https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	~/.rbenv/bin/rbenv install 2.3.0
	~/.rbenv/bin/rbenv global 2.3.0
	gem install premailer
	$DIR/bashrc.sh
fi

add_lines ~/.bashrc "# rbenv, adding to path and stuff
export PATH=\"\$HOME/.rbenv/bin:\$PATH\"
eval \"\$(rbenv init -)\"
export PATH=\"\$HOME/.rbenv/plugins/ruby-build/bin:\$PATH\""
