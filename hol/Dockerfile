FROM ubuntu:latest AS hol

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
 && apt install -y git build-essential gnupg2 python3 wget unzip silversearcher-ag rgrep sudo psmisc mlton \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/polyml/polyml.git --depth=1 --branch v5.9.1 /polyml \
 && cd /polyml \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && rm -rf /polyml

ARG HOL_BRANCH=develop
ARG HOL_DIR=/opt/hol
ENV HOLDIR="$HOL_DIR"

RUN git clone https://github.com/HOL-Theorem-Prover/HOL.git --depth=1 --branch $HOL_BRANCH $HOL_DIR \
 && cd $HOL_DIR \
 && poly --script tools/smart-configure.sml \
 && ./bin/build

RUN ln -s $HOL_DIR/bin/hol /usr/local/bin/hol \
 && ln -s $HOL_DIR/bin/Holmake /usr/local/bin/Holmake
