#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

git_clone_or_pull git://github.com/JuliaLang/julia.git ~/.julia

sudo apt-get install -y libssl0.9.8
cd ~/.julia
git checkout release-0.5
make
make testall

julia julia.jl
