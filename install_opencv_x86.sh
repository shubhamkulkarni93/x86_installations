#!/bin/sh

sudo apt-get -y update
### Update gcc apt package to the latest version (highly recommended)
sudo apt-get -y install --only-upgrade g++-5 cpp-5 gcc-5
### Install dependencies accroding to Installing OpenCV Guide

sudo apt-get -y install build-essential make cmake cmake-curses-gui \
                       g++ libavformat-dev libavutil-dev \
                       libswscale-dev libv4l-dev libeigen3-dev \
                       libglew-dev libgtk2.0-dev

### Install dependencies for gstreamer stuffs
sudo apt-get -y install libdc1394-22-dev libxine2-dev \
                       libgstreamer1.0-dev \
                       libgstreamer-plugins-base1.0-dev

### Install additional dependencies according to the pyimageresearch
### article
sudo apt-get -y install libjpeg8-dev libjpeg-turbo8-dev libtiff5-dev \
                       libjasper-dev libpng12-dev libavcodec-dev
sudo apt-get -y install libxvidcore-dev libx264-dev libgtk-3-dev \
                       libatlas-base-dev gfortran
sudo apt-get -y install libopenblas-dev liblapack-dev liblapacke-dev
### Install Qt5 dependencies
sudo apt-get -y install qt5-default
### Install dependencies for python3
sudo apt-get -y install python3-dev python3-pip python3-tk
sudo pip3 install numpy
sudo pip3 install matplotlib
### Also install dependencies for python2
### Install numpy with pip, so that we will be using a newer for version of numpy than the apt-get package
sudo apt-get -y install python-dev python-pip python-tk
sudo pip2 install numpy
sudo pip2 install matplotlib

# Now install OpenCV 4.0.1 for x86 architecture

mkdir ~/opencv_build && cd ~/opencv_build
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
cd ~/opencv_build/opencv; mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
    -D WITH_LIBV4L=ON .. \
    -D BUILD_EXAMPLES=ON ..
sudo make -j12 install
sudo ldconfig
python3 -c 'import cv2; print(cv2.__version__)'
python -c 'import cv2; print(cv2.__version__)'
