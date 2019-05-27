#!/bin/bash
# Currently not working
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

# NOT WORKING
# Tips for the installation on Ubuntu 16.04 LTS
# https://cgcvtutorials.wordpress.com/2017/05/31/install-mitsuba-on-linux-16-04/

$PACKAGE_INSTALL build-essential scons qt4-dev-tools libpng-dev libjpeg-dev libilmbase-dev libxerces-c-dev libboost-all-dev libopenexr-dev libglewmx-dev libxxf86vm-dev libeigen3-dev libfftw3-dev # libpcrecpp0 
# might have to download and install the last package from https://packages.ubuntu.com/trusty-updates/libpcrecpp0

wget https://www.mitsuba-renderer.org/repos/mitsuba/archive/tip.zip
unzip tip.zip
mv mitsuba-af602c6fd98a/ ~/.mitsuba
cd ~/.mitsuba

cp build/config-linux-gcc.py config.py

# substitute for the src/bsdfs/irawan.h
sed -i 's/BOOST_VERSION >= 106000/BOOST_VERSION >= 105800' src/bsdfs/irawan.h # not tested

# substitute for the include/mitsuba/core/autodiff.h
# from
# 	inline DScalar1& operator*=(const Scalar &v) {
# 		value *= v;
# 		grad *= v;
# 		return *this;
# 	}
# to
# 	inline DScalar1& operator*=(const DScalar1 &v) {
# 	    grad = v.grad * value + grad * v.value;
# 	    value *= v.value;
# 	    return *this;
# 	}

scons –j 8
