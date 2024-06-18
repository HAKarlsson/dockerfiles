FROM debian:latest

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y autoconf automake autotools-dev curl python3 \
       python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential \
       bison flex texinfo gperf libtool patchutils bc zlib1g-dev \
       libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev \
       libncurses5-dev meson

RUN git clone https://github.com/riscv-collab/riscv-gnu-toolchain /workdir --depth 1 --branch 2024.04.12 \
    && cd /workdir \
    && ./configure --enable-multilib --with-cmodel=medany \
    && make \
    && rm -rf /workdir

RUN git clone https://github.com/picolibc/picolibc /workdir --depth 1 --branch 1.8.6 \
    && cd /workdir \
    && meson \
    --prefix="/usr/riscv64-unknown-elf" \
    --buildtype=plain \
    -Dformat-default=minimal \
    -Dminimal-io-long-long=true \
    --cross-file "scripts/cross-riscv64-unknown-elf.txt" \
    "$(pwd)" build \
    && meson compile -C build \
    && meson install -C build \
    && rm -rf /workdir
