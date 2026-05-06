#!/usr/bin/env bash

set -e

docker build --build-arg HOL_BRANCH=develop -t hakarlsson/hol:latest .
docker build --build-arg HOL_BRANCH=trindemossen-2 --build-arg HOL_DIR=/opt/hol_t2 -t hakarlsson/hol:t2 .

docker push hakarlsson/hol:latest
docker push hakarlsson/hol:t2
