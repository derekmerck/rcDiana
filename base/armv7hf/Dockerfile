ARG RCD_ARCH
FROM resin/raspberrypi3-debian:stretch
MAINTAINER Derek Merck <derek_merck@brown.edu>

# Need to setup shell to see environment variables
RUN echo ". <(xargs -0 bash -c 'printf \"export %q\n\" \"\$@\"' -- < /proc/1/environ)" >> /root/.profile

COPY ./conf*.sh /usr/src/app/config/

COPY ./start.sh /usr/src/app
CMD /bin/bash /usr/src/app/start.sh

ENV RESIN_DEVICE_NAME_AT_INIT rcDiana-$RCD_ARCH
RUN echo "Building base for $RESIN_DEVICE_NAME_AT_INIT"

ENV ORTHANC_PASSWORD 0rthanC!
ENV ROOT_PASSWORD passw0rd!
ENV CONDA_PKG https://github.com/jjhelmus/berryconda/releases/download/v2.0.0/Berryconda2-2.0.0-Linux-armv7l.sh

# Enable resin.io's systemd init system in the container, so it never closes
ENV INITSYSTEM on
