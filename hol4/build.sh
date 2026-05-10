#!/usr/bin/env bash

export DOCKER_USER=hakarlsson
export POLYML_VERSION=v5.9.2
export HOL4_VERSION=trindemossen-2
export HOL4VSCODE_VERSION=0.0.20
docker buildx bake --pull --push
