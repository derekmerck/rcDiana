FROM conda
MAINTAINER Derek Merck <derek_merck@brown.edu>

RUN apt-get update && apt-get install -yq --no-install-recommends \
        build-essential \
        python2.7-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN conda install scipy blas mkl-service pydot-ng h5py \
   && pip install parameterized

ARG THEANO_VERSION=1.0.1
ENV THEANO_FLAGS='device=cpu,floatX=float32'
RUN pip --no-cache-dir install git+https://github.com/Theano/Theano.git@rel-${THEANO_VERSION}

ARG KERAS_VERSION=2.1.4
ENV KERAS_BACKEND=theano
RUN pip --no-cache-dir install --no-dependencies git+https://github.com/fchollet/keras.git@${KERAS_VERSION}

ENV MKL_THREADING_LAYER=GNU

# quick test and dump package lists
RUN python -c "import theano; print(theano.__version__)" \
 && dpkg-query -l > /dpkg-query-l.txt \
 && pip freeze > /pip-freeze.txt