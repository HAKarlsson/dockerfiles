FROM debian:latest AS hol
ENV PATH="$PATH:/hol/bin"
ENV HOLDIR="/hol"
RUN apt update && apt install -y git build-essential gnupg2
RUN git clone https://github.com/polyml/polyml.git --depth=1 --branch v5.9.2 /polyml \
 && cd /polyml \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && rm -rf /polyml
RUN git clone https://github.com/HOL-Theorem-Prover/HOL.git --depth=1 --branch develop /hol \
 && cd /hol \
 && poly < tools/smart-configure.sml \
 && ./bin/build
