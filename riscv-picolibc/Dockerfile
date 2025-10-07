FROM ubuntu:latest AS riscv-picolibc

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y autoconf automake autotools-dev curl python3 \
    python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential \
    bison flex texinfo gperf libtool patchutils bc zlib1g-dev \
    libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev \
    libncurses5-dev meson qemu-system-riscv64 clang-format cloc \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/riscv-collab/riscv-gnu-toolchain /workdir --depth 1 --branch 2025.09.28 \
 && cd /workdir \
 && ./configure --enable-multilib --with-cmodel=medany \
 && make -j4 \
 && rm -rf /workdir

RUN git clone https://github.com/picolibc/picolibc /workdir --depth 1 --branch 1.8.10 \
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
