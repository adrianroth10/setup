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

if [ "$1" == "2" ]; then
	rm -rf ~/.julia ~/.julia_pkg
fi

git_clone_or_pull git://github.com/JuliaLang/julia.git ~/.julia
if [ "$PULLED" == "TRUE" -o "$1" == "1" ]; then
	cd ~/.julia
	git checkout release-0.5
	make
fi
PULLED=FALSE

$DIR/../bashrc.sh
export JULIA_PKGDIR="$HOME/.julia_pkg"
~/.julia/julia $DIR/julia.jl
