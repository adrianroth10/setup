#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

git_clone_or_pull git@github.com:fsek/web.git ~/Documents/fsek/web
cd ~/Documents/fsek/web
if ! command -versions rbenv; then
	rbenv install 2.3.0
fi
gem install bundler
bundler install

# set up database
