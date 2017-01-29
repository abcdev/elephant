FROM ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends\
        build-essential \
        cmake \
        git \
        wget \
        gcc \
        g++ \
        python-dev \
        python-numpy \
        python-pip \
        python-setuptools \
        python-scipy  \
        python3 && \
    rm -rf /var/lib/apt/lists/*

ENV PRODUCE_ROOT=/opt/produce
WORKDIR $PRODUCE_ROOT

RUN git clone https://github.com/texttheater/produce.git . && \
    cp produce /usr/local/bin/

ENV ELEPHANT_ROOT=/opt/elephant
WORKDIR $ELEPHANT_ROOT

RUN git clone --depth 1 https://github.com/ParallelMeaningBank/elephant.git . && \
    make clean && \
    make PREFIX=$ELEPHANT_ROOT && \
    chmod +x ext/elman && \
    make install

