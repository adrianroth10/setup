#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

$PACKAGE_INSTALL \
	julia \
	libgtk-3-0 \
	libssl1.0.0 \
	libssl-dev \
	gfortran \
	m4 \
	cmake \
	hdf5-tools

julia $DIR/julia.jl
