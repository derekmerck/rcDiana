# Somewhat following https://github.com/gw0/docker-keras
ARG RCD_ARCH
FROM rcdiana:${RCD_ARCH}_conda
MAINTAINER Derek Merck <derek_merck@brown.edu>

RUN apt-get update && apt-get install -yq --no-install-recommends \
        build-essential \
        python2.7-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN conda install scipy blas mkl-service pydot-ng h5py \
   && pip install parameterized

#ARG THEANO_VERSION=1.0.1
#ENV THEANO_FLAGS='device=cpu,floatX=float32'
#RUN pip --no-cache-dir install git+https://github.com/Theano/Theano.git@rel-${THEANO_VERSION}

ARG TENSORFLOW_VERSION=1.5.0
ARG TENSORFLOW_DEVICE=cpu
# Extra version tags?
ARG TENSORFLOW_APPEND
RUN pip --no-cache-dir install https://storage.googleapis.com/tensorflow/linux/${TENSORFLOW_DEVICE}/tensorflow${TENSORFLOW_APPEND}-${TENSORFLOW_VERSION}-cp27-none-linux_x86_64.whl

ARG KERAS_VERSION=2.1.4
ENV KERAS_BACKEND=theano
RUN pip --no-cache-dir install --no-dependencies git+https://github.com/fchollet/keras.git@${KERAS_VERSION}

ENV MKL_THREADING_LAYER=GNU

# quick test and dump package lists
RUN python -c "import tensorflow; print(tensorflow.__version__)" \
 && dpkg-query -l > /dpkg-query-l.txt \
 && pip freeze > /pip-freeze.txt