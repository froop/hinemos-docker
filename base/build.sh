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

FROM_TAG=${DST_TAG}
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

FROM_TAG=${DST_TAG}
CONTEXT=base/hinemos-base
DST_TAG=hinemos-base:openjdk${JAVA_VER}-${OS_IMAGE}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--add-host=docker-host:${LOCAL_IP}
