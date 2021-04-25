FROM python:3.9.4

ENV DEBIAN_FRONTEND noninteractive
ENV PATH="/home/svtplay-dl/.local/bin:${PATH}"

RUN set -xe && \
    apt update && \
    apt install -y -qq --no-install-recommends locales ffmpeg && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    useradd -ms /bin/bash svtplay-dl && \
    locale-gen

USER svtplay-dl
ADD requirements.txt /home/svtplay-dl/

RUN set -xe && \
    /usr/local/bin/python -m pip install --upgrade pip && \
    pip3 install --user -r /home/svtplay-dl/requirements.txt

WORKDIR /data

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
