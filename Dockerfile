# Run Debian Sid in a container for bug fixes
#
# docker run -it \
#	    --name debian-bugfix \
#       vlpontes/debian-bugfix:latest

FROM debian:unstable
LABEL maintainer="Virginia Pontes <vpontes@hotmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb-src http://deb.debian.org/debian unstable main" >> /etc/apt/sources.list \
    && apt update \
    && apt full-upgrade -y \
    && apt install -y \
    devscripts \
    git

RUN mkdir -p /home/pkgs
WORKDIR /home/pkgs

