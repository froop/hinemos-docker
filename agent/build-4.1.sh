#!/bin/bash -eu

. .env

SERVICE=agent
JRE_TAG=${JAVA_IMAGE}${JAVA_VER}-${OS_IMAGE}
MAJOR_DIR=${SERVICE}/${AGENT_MAJOR}
MINOR_DIR=${MAJOR_DIR}/${AGENT_MINOR}
PACKAGE=hinemos_agent-${AGENT_MAJOR}.${AGENT_MINOR}_rhel5-7.tar.gz

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
	--build-arg PACKAGE=${PACKAGE} \
	--add-host=docker-host:${LOCAL_IP}
