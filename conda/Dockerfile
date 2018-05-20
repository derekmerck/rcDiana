FROM sshd
MAINTAINER Derek Merck <derek_merck@brown.edu>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && apt-get install -yq --no-install-recommends \
        wget \
        bzip2 \
        ca-certificates \
        libglib2.0-0 \
        libxext6 \
        libsm6 \
        libxrender1 \
        git \
        mercurial \
        subversion \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ENV CONDA_PKG https://repo.continuum.io/miniconda/Miniconda2-4.4.10-Linux-x86_64.sh
# https://repo.continuum.io/miniconda/Miniconda-3.16.0-Linux-armv7l.sh
# ENV CONDA_PKG https://github.com/jjhelmus/berryconda/releases/download/v2.0.0/Berryconda2-2.0.0-Linux-armv7l.sh

RUN wget --quiet "$CONDA_PKG" -O ~/conda.sh && \
    yes | /bin/bash ~/conda.sh -b -f -p /opt/conda && \
    rm ~/conda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "source activate base" >> ~/.bashrc

# In a new shell
# Path not set right in aarch64
RUN conda update -y conda || echo "Error: Failed to update conda (check path?)"