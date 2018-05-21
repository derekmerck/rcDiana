ARG RCD_ARCH
FROM rcdiana:${RCD_ARCH}_base
MAINTAINER Derek Merck <derek_merck@brown.edu>

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

COPY ./conf*.sh /usr/src/app/config/
