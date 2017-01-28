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

git_clone_or_pull git://github.com/JuliaLang/julia.git ~/.julia
if [ $PULLED == TRUE ]; then
	cd ~/.julia
	git checkout release-0.5
	make
	make testall

fi
PULLED=FALSE

$DIR/../bashrc.sh
export JULIA_PKGDIR="~/.julia_pkg"
~/.julia/julia $DIR/julia.jl
