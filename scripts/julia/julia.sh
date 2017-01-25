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

if ! command -v ~/.julia/julia >/dev/null; then
	git_clone_or_pull git://github.com/JuliaLang/julia.git ~/.julia

	cd ~/.julia
	git checkout release-0.5
	make
	make testall

fi
$DIR/../bashrc.sh
~/.julia/julia $DIR/julia.jl
