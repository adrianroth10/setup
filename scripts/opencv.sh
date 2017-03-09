#!/bin/bash
# Currently has a bug where the sudo password must be written twice
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

if [ "$F" == "ff" ]; then
	rm -rf ~/.opencv ~/.opencv_contrib
fi

if [ "$F" == "f" ] || ! command -v opencv_version ; then
	$PACKAGE_INSTALL \
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
		libdc1394-22-dev \
		libv4l-dev \
		libv4l-0

	if [ -d ~/.opencv ]; then
		cd ~/.opencv
		git reset --hard HEAD
	fi
	git_clone_or_pull https://github.com/opencv/opencv.git ~/.opencv
	git_clone_or_pull https://github.com/opencv/opencv_contrib.git ~/.opencv_contrib
	cd ~/.opencv
	mkdir -p build

	# Changing one line in CMakeLists.txt to add contrib modules
	sed '463s/.*/set(OPENCV_EXTRA_MODULES_PATH "~\/.opencv_contrib\/modules\/" CACHE PATH "Where to look for additional OpenCV modules")/' CMakeLists.txt > temp
	mv temp CMakeLists.txt

	cd build
	cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
	make
	sudo make install

	echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/opencv.conf
	sudo ldconfig -v
fi
