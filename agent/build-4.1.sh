#!/bin/bash -eu

. .env

SERVICE=agent
JRE_TAG=${JAVA_IMAGE}${JAVA_VER}-${OS_IMAGE}
MAJOR_DIR=${SERVICE}/${AGENT_MAJOR}
MINOR_DIR=${MAJOR_DIR}/${AGENT_MINOR}

FROM_TAG=${REPOSITORY}/hinemos-base-${JRE_TAG}
CONTEXT=${MINOR_DIR}/package
DOCKERFILE=${MAJOR_DIR}/common/DockerfilePackage
DST_TAG=${REPOSITORY}/hinemos-${SERVICE}-package-${JRE_TAG}:${AGENT_MAJOR}.${AGENT_MINOR}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "Dockerfile: ${DOCKERFILE}"
echo "================================================================================"
docker build -t ${DST_TAG} -f ${DOCKERFILE} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg MINOR_VER=${AGENT_MINOR} \
	--add-host=docker-host:${LOCAL_IP}
