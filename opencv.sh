sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

git clone https://github.com/opencv/opencv.git ~/.opencv
git clone https://github.com/opencv/opencv_contrib.git ~/.opencv_contrib
rm -rf ~./opencv_contriv/modules/matlab
cd ~/.opencv
mkdir -p release
sed '463s/.*/set(OPENCV_EXTRA_MODULES_PATH "~\/.opencv_contrib\/modules\/" CACHE PATH "Where to look for additional OpenCV modules")/' CMakeLists.txt > temp
mv temp CMakeLists.txt
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make
sudo make install
cd

echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/opencv.conf
sudo ldconfig -v

#rm -r ~/.opencv
#rm -r ~/.opencv_contrib
