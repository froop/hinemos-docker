#!/bin/bash -eu

SERVICE=$1
JRE_TAG=${JAVA_IMAGE}-${OS_IMAGE}
MAJOR_DIR=${SERVICE}/${HINEMOS_MAJOR}
MINOR_DIR=${MAJOR_DIR}/${HINEMOS_MINOR}

VANILLA_DIR=${MINOR_DIR}/vanilla/patch
if [ ! -d ${VANILLA_DIR} ]; then
	echo "Create file: ${VANILLA_DIR}/dummy"
	mkdir -p ${VANILLA_DIR}
	touch ${VANILLA_DIR}/dummy
fi

FROM_TAG=${REPOSITORY}/hinemos-base-${JRE_TAG}
if [[ "$(docker images -q ${FROM_TAG})" == "" ]]; then
	exit 0
fi

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
DST_TAG=hinemos-${SERVICE}-major-base-${JRE_TAG}:${HINEMOS_MAJOR}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "================================================================================"
docker build -t ${DST_TAG} ${CONTEXT} \
        --build-arg FROM=${FROM_TAG}

CONTEXT=${MINOR_DIR}/package/${DISTRIBUTION}

if [ ${HINEMOS_MAJOR} = "5.0" ]; then
	PACKAGE=hinemos-${SERVICE}-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-1.${DISTRIBUTION}.${ARCHITECTURE}.rpm
	PACKAGE_URL=https://ja.osdn.net/dl/hinemos/${PACKAGE}
else
	PACKAGE=hinemos-${HINEMOS_MAJOR}-${SERVICE}-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-1.${DISTRIBUTION}.${ARCHITECTURE}.rpm
	PACKAGE_URL=https://github.com/hinemos/hinemos/releases/download/v${HINEMOS_MAJOR}.${HINEMOS_MINOR}/${PACKAGE}
fi
if [ ! -f ${CONTEXT}/${PACKAGE} ]; then
	wget -P ${CONTEXT} ${PACKAGE_URL}
fi

FROM_TAG=${DST_TAG}
DOCKERFILE=${SERVICE}/common/DockerfilePackage
DST_TAG=${REPOSITORY}/hinemos-${SERVICE}-${JRE_TAG}:${HINEMOS_MAJOR}.${HINEMOS_MINOR}
echo "================================================================================"
echo "Tag    : ${DST_TAG}"
echo "From   : ${FROM_TAG}"
echo "Context: ${CONTEXT}"
echo "Dockerfile: ${DOCKERFILE}"
echo "================================================================================"
docker build -t ${DST_TAG} -f ${DOCKERFILE} ${CONTEXT} \
	--build-arg FROM=${FROM_TAG} \
	--build-arg PACKAGE=${PACKAGE}

#docker compose build ${SERVICE}
