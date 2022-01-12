#!/bin/bash -eu

. .env
JRE_TAG=${JAVA_IMAGE}-${OS_IMAGE}

DST_TAG=${REPOSITORY}/hinemos-manager-restored-${JRE_TAG}:${MANAGER_MAJOR}.${MANAGER_MINOR}
FROM_TAG=${REPOSITORY}/hinemos-manager-${JRE_TAG}:${MANAGER_MAJOR}.${MANAGER_MINOR}
CONTEXT=manager/${MANAGER_MAJOR}/${MANAGER_MINOR}/restore
DOCKERFILE=manager/common/DockerfileRestore
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "Dockerfile: ${DOCKERFILE}"
echo "================================================================================"
docker build -t ${DST_TAG} -f ${DOCKERFILE} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG}
