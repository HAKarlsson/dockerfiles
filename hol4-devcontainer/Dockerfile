ARG BASE_IMAGE=ubuntu:24.04
FROM $BASE_IMAGE

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y git build-essential gnupg2 python3 wget unzip silversearcher-ag rgrep sudo psmisc mlton curl ca-certificates \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/polyml/polyml.git --depth=1 --branch v5.9.1 /polyml \
 && cd /polyml \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && rm -rf /polyml

ARG HOL_BRANCH=trindemossen-2
ARG HOL_VSCODE=0.0.20

ENV HOLDIR=/HOL
ENV PATH=$HOLDIR/bin:$PATH

RUN git clone https://github.com/HOL-Theorem-Prover/HOL.git --depth=1 --branch $HOL_BRANCH $HOLDIR \
 && cd $HOLDIR \
 && poly --script tools/smart-configure.sml \
 && ./bin/build


RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN curl -fsSL \
      "https://oskarabrahamsson.gallery.vsassets.io/_apis/public/gallery/publisher/oskarabrahamsson/extension/hol4-mode/${HOL_VSCODE}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage" \
      -o /tmp/hol4-mode.vsix \
 && code-server --install-extension /tmp/hol4-mode.vsix \
 && rm /tmp/hol4-mode.vsix \
 && mkdir -p /root/.vscode-server/extensions /root/.vscode-server-insiders/extensions \
 && cp -a /root/.local/share/code-server/extensions/. /root/.vscode-server/extensions/ \
 && cp -a /root/.local/share/code-server/extensions/. /root/.vscode-server-insiders/extensions/
