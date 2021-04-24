#!/bin/bash -eu

. .env

CONTEXT=base/${OS_IMAGE}
DST_TAG=${OS_IMAGE}:latest
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--add-host=docker-host:${LOCAL_IP}
