#!/bin/bash -eu

. .env

FROM_TAG=frooprogrammer/${OS_IMAGE}:latest
CONTEXT=base/openjdk-devel-redhat
DST_TAG=frooprogrammer/openjdk-devel-${OS_IMAGE}:${JAVA_VER}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg VERSION=${JAVA_VER} \
	--add-host=docker-host:${LOCAL_IP}
