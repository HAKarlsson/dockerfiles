#!/usr/bin/env bash

set -euo pipefail

VERSION=trindemossen-2
HOL_VSCODE=0.0.20
IMAGE=hakarlsson/hol4-devcontainer

docker build \
	--pull \
	--build-arg HOL_BRANCH=${VERSION} \
	--build-arg HOL_VSCODE=${HOL_VSCODE} \
	-t "${IMAGE}:${VERSION}" \
	-t "${IMAGE}:latest" .

docker push "${IMAGE}:${VERSION}"
docker push "${IMAGE}:latest"
