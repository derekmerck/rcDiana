FROM rcdiana:${RCD_ARCH}_sshd
MAINTAINER Derek Merck <derek_merck@brown.edu>

# Install apt dependencies and remove the apt lists, which reduces
# the size of the docker image.
RUN apt-get update && apt-get install -yq --no-install-recommends \
        orthanc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Persistent storage can attach here
VOLUME [ "/var/lib/orthanc/db" ]

EXPOSE 8042
EXPOSE 4242

COPY ./conf*.sh /usr/src/app/config/
