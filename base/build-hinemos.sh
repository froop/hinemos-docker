#!/bin/bash -eu

. .env

FROM_TAG=${REPOSITORY}/${JAVA_IMAGE}-${OS_IMAGE}:latest
CONTEXT=base/hinemos-base
DST_TAG=${REPOSITORY}/hinemos-base-${JAVA_IMAGE}-${OS_IMAGE}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--add-host=docker-host:${LOCAL_IP}
