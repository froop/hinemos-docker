#!/bin/bash -eu

IMAGE=centos:7

docker image pull ${IMAGE}
docker save ${IMAGE} > distribution.tar
gzip distribution.tar
