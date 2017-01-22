#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../functions.sh

if ! opencv_version >/dev/null; then
	package_install \
		build-essential \
		cmake \
		git \
		libgtk2.0-dev \
		pkg-config \
		libavcodec-dev \
		libavformat-dev \
		libswscale-dev \
		python-dev \
		python-numpy \
		libtbb2 \
		libtbb-dev \
		libjpeg-dev \
		libpng-dev \
		libtiff-dev \
		libjasper-dev \
		libdc1394-22-dev

	git clone https://github.com/opencv/opencv.git ~/.opencv
	git clone https://github.com/opencv/opencv_contrib.git ~/.opencv_contrib
	rm -rf ~./opencv_contriv/modules/matlab
	cd ~/.opencv
	mkdir -p release

	# Changing one line in CMakeLists.txt to add contrib modules
	sed '463s/.*/set(OPENCV_EXTRA_MODULES_PATH "~\/.opencv_contrib\/modules\/" CACHE PATH "Where to look for additional OpenCV modules")/' CMakeLists.txt > temp
	mv temp CMakeLists.txt

	cd release
	cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
	make
	sudo make install

	echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/opencv.conf
	sudo ldconfig -v
fi
