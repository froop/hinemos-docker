#!/bin/bash -eu

. .env

FROM_TAG=${OS_IMAGE}:latest
CONTEXT=base/openjdk-redhat
DST_TAG=openjdk-${OS_IMAGE}:${JAVA_VER}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg VERSION=${JAVA_VER} \
	--add-host=docker-host:${LOCAL_IP}
