#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.julia ~/.julia_pkg
fi

if [ "$F" == "f" ] || ! command -v julia ; then
	$PACKAGE_INSTALL \
		libgtk-3-0 \
		libssl1.0.0 \
		libssl-dev \
		gfortran \
		m4 \
		cmake \
		hdf5-tools

	git_clone_or_pull git://github.com/JuliaLang/julia.git ~/.julia
	cd ~/.julia
	git checkout release-0.5
	make
fi

export JULIA_PKGDIR="$HOME/.julia_pkg"
~/.julia/julia $DIR/julia.jl

add_lines ~/.bashrc "# julia
export PATH=\"~/.julia:\$PATH\"
export JULIA_PKGDIR=\"/home/rotharen/.julia_pkg\"

"
