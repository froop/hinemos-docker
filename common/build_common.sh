#!/bin/bash -eu

SERVICE=$1
JRE_TAG=openjdk${JAVA_VER}-${OS_IMAGE}
MAJOR_DIR=${SERVICE}/${HINEMOS_MAJOR}
MINOR_DIR=${MAJOR_DIR}/${HINEMOS_MINOR}

FROM_TAG=hinemos-base-${JRE_TAG}
CONTEXT=${SERVICE}/base
DST_TAG=hinemos-${SERVICE}-base-${JRE_TAG}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--add-host=docker-host:${LOCAL_IP}

FROM_TAG=${DST_TAG}
CONTEXT=${MAJOR_DIR}/base
DST_TAG=hinemos-${SERVICE}-base-${HINEMOS_MAJOR}-${JRE_TAG}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
        --build-arg FROM=${FROM_TAG}

if [ ! -f ${MINOR_DIR}/vanilla/patch/dummy ]; then
	mkdir -p ${MINOR_DIR}/vanilla/patch
	touch ${MINOR_DIR}/vanilla/patch/dummy
fi

CONTEXT=${MINOR_DIR}/package/${DISTRIBUTION}

if [ ${HINEMOS_MAJOR} = "5.0" ]; then
	PACKAGE=hinemos-${SERVICE}-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-1.${DISTRIBUTION}.${ARCHITECTURE}.rpm
else
	PACKAGE=hinemos-${HINEMOS_MAJOR}-${SERVICE}-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-1.${DISTRIBUTION}.${ARCHITECTURE}.rpm
	if [ ! -f ${CONTEXT}/${PACKAGE} ]; then
		wget -P ${CONTEXT} https://github.com/hinemos/hinemos/releases/download/v${HINEMOS_MAJOR}.${HINEMOS_MINOR}/${PACKAGE}
	fi
fi

FROM_TAG=${DST_TAG}
DOCKERFILE=${SERVICE}/common/DockerfilePackage
DST_TAG=hinemos-${SERVICE}-base-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-${JRE_TAG}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "Dockerfile: ${DOCKERFILE}"
echo "================================================================================"
docker build -t ${DST_TAG} -f ${DOCKERFILE} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg PACKAGE=${PACKAGE}

#docker-compose build ${SERVICE}
