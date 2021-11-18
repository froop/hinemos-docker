#!/bin/bash -eu

. .env

FROM_TAG=${REPOSITORY}/${OS_IMAGE}:latest
CONTEXT=base/java/${JAVA_IMAGE}
DST_TAG=${REPOSITORY}/${JAVA_IMAGE}-${OS_IMAGE}:${JAVA_VER}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg VERSION=${JAVA_VER} \
	--add-host=docker-host:${LOCAL_IP}
