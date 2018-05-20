# FROM debian:stretch
FROM resin/jetson-tx2-debian:stretch
MAINTAINER Derek Merck <derek_merck@brown.edu>

# Need to setup shell to see environment variables
RUN echo ". <(xargs -0 bash -c 'printf \"export %q\n\" \"\$@\"' -- < /proc/1/environ)" >> /root/.profile

COPY ./conf*.sh /usr/src/app/config/

COPY ./start.sh /usr/src/app
CMD /bin/bash /usr/src/app/start.sh

ARG RCD_ARCH
#ENV RESIN_DEVICE_NAME_AT_INIT rcDiana-$RCD_ARCH
ENV RESIN_DEVICE_NAME_AT_INIT rcDiana-aarch64
RUN echo "Building base for $RESIN_DEVICE_NAME_AT_INIT"

ENV ORTHANC_PASSWORD 0rthanC!
ENV ROOT_PASSWORD passw0rd!
ENV CONDA_PKG https://www.dropbox.com/s/22mc9rlds2iijes/JetsonConda-0.1-Linux-aarch64.sh

# Enable resin.io's systemd init system in the container, so it never closes
ENV INITSYSTEM on

# Install apt dependencies and remove the apt lists, which reduces
# the size of the docker image.
RUN apt-get update && apt-get install -yq --no-install-recommends \
        openssh-server \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up the config for openSSH.  Stretch has PermitRootLogin commented by default
RUN mkdir /var/run/sshd \
    && echo 'root:passw0rd!' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

EXPOSE 22

COPY ./conf*.sh /usr/src/app/config
