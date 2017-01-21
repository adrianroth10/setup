#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../functions.sh

if ! command -v ~/.julia/julia >/dev/null; then
	git clone git://github.com/JuliaLang/julia.git ~/.julia

	package_install libssl1.0.0 libssl-dev
	cd ~/.julia
	git checkout release-0.5
	make
	make testall

	julia $DIR/julia.jl
	$DIR/../bashrc.sh
fi
