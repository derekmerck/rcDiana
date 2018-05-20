# Following http://alexsm.com/building-opencv-with-conda
# FROM conda
ARG RCD_ARCH
FROM derekmerck/rcdiana:${RCD_ARCH}_conda
MAINTAINER Derek Merck <derek_merck@brown.edu>

# Add cmake config
COPY xcmake.sh /usr/src/app/

# Install dependencies
RUN apt-get update && apt-get install -yq --no-install-recommends \
        build-essential \
        cmake \
        pkg-config \
        libtiff5-dev \
        libopenjp2-7-dev \
        libpng-dev \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        libv4l-dev \
        libxvidcore-dev \
        libx264-dev \
        libgtk-3-dev \
        libatlas-base-dev \
        gfortran \
        python2.7-dev \
   && apt-get clean && rm -rf /var/lib/apt/lists/*

# Source pulls
RUN mkdir /opt/opencv \
   && cd /opt/opencv \
   && git clone https://github.com/opencv/opencv.git \
   && git clone https://github.com/opencv/opencv_contrib.git \
   && cd /opt/opencv/opencv; git checkout 3.4.1 \
   && cd /opt/opencv/opencv_contrib; git checkout 3.4.1 \

RUN mkdir /opt/opencv/opencv/build \
   && cd /opt/opencv/opencv/build \
   && /bin/bash /usr/src/app/xcmake.sh \
   && make -j4 \
   && make install \
   && ldconfig

#RUN ln -s \
#    /usr/local/lib/python2.7/site-packages/cv2.cpython-36m-x86_64-linux-gnu.so \
#    $HOME/.conda/envs/base/lib/python3.6/site-packages/cv2.so

#RUN rm -rf /opt/opencv