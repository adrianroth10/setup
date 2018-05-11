#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

# Working but gets old version
#$PACKAGE_INSTALL \
#	libopencv-apps-dev \
#	libopencv-apps0d \
#	libopencv-calib3d-dev \
#	libopencv-calib3d2.4v5 \
#	libopencv-contrib-dev \
#	libopencv-contrib2.4v5 \
#	libopencv-core-dev \
#	libopencv-core2.4v5 \
#	libopencv-dev \
#	libopencv-features2d-dev \
#	libopencv-features2d2.4v5 \
#	libopencv-flann-dev \
#	libopencv-flann2.4v5 \
#	libopencv-gpu-dev \
#	libopencv-gpu2.4v5 \
#	libopencv-highgui-dev \
#	libopencv-highgui2.4v5 \
#	libopencv-imgproc-dev \
#	libopencv-imgproc2.4v5 \
#	libopencv-legacy-dev \
#	libopencv-legacy2.4v5 \
#	libopencv-ml-dev \
#	libopencv-ml2.4v5 \
#	libopencv-objdetect-dev \
#	libopencv-objdetect2.4v5 \
#	libopencv-ocl-dev \
#	libopencv-ocl2.4v5 \
#	libopencv-photo-dev \
#	libopencv-photo2.4v5 \
#	libopencv-stitching-dev \
#	libopencv-stitching2.4v5 \
#	libopencv-superres-dev \
#	libopencv-superres2.4v5 \
#	libopencv-ts-dev \
#	libopencv-ts2.4v5 \
#	libopencv-video-dev \
#	libopencv-video2.4v5 \
#	libopencv-videostab-dev \
#	libopencv-videostab2.4v5 \
#	opencv-data \
#	opencv-doc \
#	python-cv-bridge \
#	python-opencv \
#

# Not working
#if [ "$F" == "ff" ]; then
#	rm -rf ~/.opencv ~/.opencv_contrib
#fi
#
#if [ "$F" == "f" ] || ! command -v opencv_version ; then
#	$PACKAGE_INSTALL \
#		libopencv-dev build-essential cmake git libgtk2.0-dev pkg-config \
#		python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev  \
#		libpng12-dev libtiff5-dev libjasper-dev libavcodec-dev libavformat-dev \
#		libswscale-dev libxine2-dev libgstreamer0.10-dev \
#		libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev \
#		libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev \
#		libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip\
#
#	#cd /usr/include/linux
#	#sudo ln -sf ../libv4l1-videodev.h videodev.h
#
#	if [ -d ~/.opencv ]; then
#		cd ~/.opencv
#		git reset --hard HEAD
#	fi
#	git_clone_or_pull https://github.com/opencv/opencv.git ~/.opencv
#	git_clone_or_pull https://github.com/opencv/opencv_contrib.git ~/.opencv_contrib
#	cd ~/.opencv
#	mkdir -p build
#
#	# Changing one line in CMakeLists.txt to add contrib modules
#	sed -i '463s/.*/set(OPENCV_EXTRA_MODULES_PATH "~\/.opencv_contrib\/modules\/" CACHE PATH "Where to look for additional OpenCV modules")/' CMakeLists.txt
#
#	cd build
#	cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local .. 
#	make
#	sudo make install
#
#	echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/opencv.conf
#	sudo ldconfig -v
#fi

# Version which seems to work for opencv 3.4.0, script not tested
# see http://www.python36.com/how-to-install-opencv340-on-ubuntu1604/

#prerequisites
sudo apt-get install build-essential 
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev

sudo apt-get install libgtk-3-dev

sudo apt-get install libatlas-base-dev gfortran pylint

sudo apt-get install python2.7-dev python3.5-dev

# Downloading and unziping
cd ~
wget https://github.com/opencv/opencv/archive/3.4.0.zip -O opencv-3.4.0.zip
wget https://github.com/opencv/opencv_contrib/archive/3.4.0.zip -O opencv_contrib-3.4.0.zip

sudo apt-get install unzip
unzip opencv-3.4.0.zip
unzip opencv_contrib-3.4.0.zip

# Making and building
cd opencv-3.4.0
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.0/modules -DOPENCV_ENABLE_NONFREE=True ..

make -j4
sudo make install
sudo ldconfig
