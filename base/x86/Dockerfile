FROM debian:stretch
MAINTAINER Derek Merck <derek_merck@brown.edu>

COPY ../conf*.sh /usr/src/app/config/

COPY ../start.sh /usr/src/app
CMD /bin/bash /usr/src/app/start.sh

ENV RESIN_DEVICE_NAME_AT_INIT rcDiana-x86
ENV ORTHANC_PASSWORD 0rthanC!
ENV ROOT_PASSWORD passw0rd!
ENV CONDA_PKG https://repo.continuum.io/miniconda/Miniconda2-4.4.10-Linux-x86_64.sh

# CMD service ssh start && tail -F /dev/null
# CMD ["sh", "-c", "tail -f /dev/null"]


