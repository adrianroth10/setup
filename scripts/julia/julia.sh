#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../functions.sh

package_install \
	libssl1.0.0 \
	libssl-dev \
	gfortran \
	m4 \
	cmake \
	hdf5-tools

if [ "$1" == "-ff" ]; then
	rm -rf ~/.julia ~/.julia_pkg
fi

if [ "$1" == "-f" ] || ! command -v julia ; then
	git_clone_or_pull git://github.com/JuliaLang/julia.git ~/.julia
	cd ~/.julia
	git checkout release-0.5
	make
fi

$DIR/../bashrc.sh
export JULIA_PKGDIR="$HOME/.julia_pkg"
~/.julia/julia $DIR/julia.jl
