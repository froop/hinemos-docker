#!/bin/bash -eu

. .env
JRE_TAG=${JAVA_IMAGE}-${OS_IMAGE}

DST_TAG=${REPOSITORY}/hinemos-manager-https-${JRE_TAG}:${MANAGER_MAJOR}.${MANAGER_MINOR}
FROM_TAG=${REPOSITORY}/hinemos-manager-${JRE_TAG}:${MANAGER_MAJOR}.${MANAGER_MINOR}
CONTEXT=manager/https
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
        --build-arg DOCKER_HOST_IP=${LOCAL_IP}
