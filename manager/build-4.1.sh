#!/bin/bash -eu

. .env

SERVICE=manager
JRE_TAG=openjdk${JAVA_VER}-${OS_IMAGE}
MAJOR_DIR=${SERVICE}/${MANAGER_MAJOR}
MINOR_DIR=${MAJOR_DIR}/${MANAGER_MINOR}
PACKAGE=hinemos_manager-${MANAGER_MAJOR}.${MANAGER_MINOR}_rhel6_64.tar.gz

FROM_TAG=frooprogrammer/hinemos-base-${JRE_TAG}
CONTEXT=${MINOR_DIR}/package
DOCKERFILE=${MAJOR_DIR}/common/DockerfilePackage
DST_TAG=frooprogrammer/hinemos-${SERVICE}-base-${MANAGER_MAJOR}.${MANAGER_MINOR}-${JRE_TAG}
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
