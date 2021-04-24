#!/bin/bash -eu

. .env

FROM_TAG=openjdk-${OS_IMAGE}:${JAVA_VER}
CONTEXT=base/hinemos-base
DST_TAG=hinemos-base-openjdk${JAVA_VER}-${OS_IMAGE}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--add-host=docker-host:${LOCAL_IP}
