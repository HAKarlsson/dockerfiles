FROM ubuntu:latest AS hol

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y git build-essential gnupg2 python3 wget unzip silversearcher-ag rgrep sudo

# HOL ARGUMENTS
ARG HOL_BRANCH=master
ARG HOL_DIR=/opt/hol

RUN git clone https://github.com/polyml/polyml.git --depth=1 --branch v5.9.1 /polyml \
 && cd /polyml \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && rm -rf /polyml

RUN git clone https://github.com/HOL-Theorem-Prover/HOL.git --depth=1 --branch $HOL_BRANCH $HOL_DIR \
 && cd $HOL_DIR \
 && poly < tools/smart-configure.sml \
 && ./bin/build

ENV PATH="$PATH:$HOL_DIR/bin"
ENV HOLDIR="$HOL_DIR"
