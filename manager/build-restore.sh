#!/bin/bash -eu

. .env
JRE_TAG=openjdk${JAVA_VER}-${OS_IMAGE}

DST_TAG=frooprogrammer/hinemos-manager-restored-${MANAGER_MAJOR}.${MANAGER_MINOR}-${JRE_TAG}
FROM_TAG=frooprogrammer/hinemos-manager-base-${MANAGER_MAJOR}.${MANAGER_MINOR}-${JRE_TAG}
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
