FROM debian:stretch-slim

ENV DEBIAN_FRONTEND noninteractive

RUN set -xe && \
    apt update && \
    apt install -y -qq --no-install-recommends python3 python3-requests python3-setuptools python3-pip locales ffmpeg && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    pip3 install svtplay-dl

WORKDIR /data

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
