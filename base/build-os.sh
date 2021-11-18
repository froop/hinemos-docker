#!/bin/bash -eu

. .env

CONTEXT=base/os/${OS_IMAGE}
DST_TAG=${REPOSITORY}/${OS_IMAGE}:latest
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--add-host=docker-host:${LOCAL_IP}
