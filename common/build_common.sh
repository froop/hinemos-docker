#!/bin/bash -eu

SERVICE=$1
JRE_TAG=openjdk${JAVA_VER}-${OS_IMAGE}

FROM_TAG=hinemos-base:openjdk${JAVA_VER}-${OS_IMAGE}
CONTEXT=${SERVICE}/base
DST_TAG=hinemos-${SERVICE}-base:${JRE_TAG}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG}

FROM_TAG=${DST_TAG}
CONTEXT=${SERVICE}/${HINEMOS_MAJOR}/base
DST_TAG=hinemos-${SERVICE}-base-${HINEMOS_MAJOR}:${JRE_TAG}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
        --build-arg FROM=${FROM_TAG}

mkdir -p ${SERVICE}/${HINEMOS_MAJOR}/${HINEMOS_MINOR}/vanilla/patch

CONTEXT=${SERVICE}/${HINEMOS_MAJOR}/${HINEMOS_MINOR}/package/${DISTRIBUTION}
PACKAGE=hinemos-${HINEMOS_MAJOR}-${SERVICE}-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-1.${DISTRIBUTION}.${ARCHITECTURE}.rpm
if [ ! -f ${CONTEXT}/${PACKAGE} ]; then
	wget -P ${CONTEXT} https://github.com/hinemos/hinemos/releases/download/v${HINEMOS_MAJOR}.${HINEMOS_MINOR}/${PACKAGE}
fi

FROM_TAG=${DST_TAG}
DOCKERFILE=${SERVICE}/common/DockerfilePackage
DST_TAG=hinemos-${SERVICE}-base-${HINEMOS_MAJOR}.${HINEMOS_MINOR}:${JRE_TAG}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "Dockerfile: ${DOCKERFILE}"
echo "================================================================================"
docker build -t ${DST_TAG} -f ${DOCKERFILE} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg MAJOR=${HINEMOS_MAJOR} \
	--build-arg MINOR=${HINEMOS_MINOR} \
	--build-arg DISTRIBUTION=${DISTRIBUTION} \
	--build-arg ARCHITECTURE=${ARCHITECTURE}

docker-compose build ${SERVICE}
