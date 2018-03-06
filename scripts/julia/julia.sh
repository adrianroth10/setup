#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.julia_pkg
fi

$PACKAGE_INSTALL \
	julia \
	libgtk-3-0 \
	libssl1.0.0 \
	libssl-dev \
	gfortran \
	m4 \
	cmake \
	hdf5-tools

export JULIA_PKGDIR="$HOME/.julia_pkg"
julia $DIR/julia.jl

add_lines ~/.bashrc "# julia
export JULIA_PKGDIR=\"/home/rotharen/.julia_pkg\"

"
