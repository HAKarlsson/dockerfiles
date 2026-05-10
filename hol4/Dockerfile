FROM debian:stable-slim AS hol4

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y git build-essential gnupg2 python3 wget unzip silversearcher-ag rgrep sudo psmisc curl ca-certificates \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG POLYML_VERSION

RUN git clone https://github.com/polyml/polyml.git --depth=1 --branch $POLYML_VERSION /polyml \
 && cd /polyml \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && rm -rf /polyml

ARG HOL4_VERSION

ENV HOLDIR=/HOL
ENV PATH=$HOLDIR/bin:$PATH

RUN git clone https://github.com/HOL-Theorem-Prover/HOL.git --depth=1 --branch $HOL4_VERSION $HOLDIR \
 && cd $HOLDIR \
 && poly --script tools/smart-configure.sml \
 && ./bin/build

FROM hol4 AS hol4-devcontainer

ARG HOL4VSCODE_VERSION

RUN curl -fsSL https://code-server.dev/install.sh | sh \
 && curl -fsSL "https://oskarabrahamsson.gallery.vsassets.io/_apis/public/gallery/publisher/oskarabrahamsson/extension/hol4-mode/${HOL4VSCODE_VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage" -o /tmp/hol4-mode.vsix \
 && code-server --install-extension /tmp/hol4-mode.vsix \
 && rm /tmp/hol4-mode.vsix \
 && mkdir -p /root/.vscode-server/extensions /root/.vscode-server-insiders/extensions \
 && cp -a /root/.local/share/code-server/extensions/. /root/.vscode-server/extensions/ \
 && cp -a /root/.local/share/code-server/extensions/. /root/.vscode-server-insiders/extensions/
